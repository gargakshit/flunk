import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';
import '../../constants/config.dart';
import '../../models/access_token.dart';
import '../../models/user.dart';
import '../../utils/random_string.dart';

class AuthServiceOAuth implements AuthService {
  @override
  Future<bool> authenticate() async {
    String state = randomString();

    try {
      final String result = await FlutterWebAuth.authenticate(
        url: "${oauthUri.toString()}&state=$state",
        callbackUrlScheme: callback,
      );

      final Uri parsedResult = Uri.parse(result);
      final String resultState = parsedResult.queryParameters["state"];
      final String error = parsedResult.queryParameters["error"];

      if (resultState == state && error == null) {
        final String code = parsedResult.queryParameters["code"];
        final Response response = await Dio().post(
          "${tokenUri.toString()}&state=$state&code=$code",
          options: Options(
            headers: {
              "accept": "application/json",
            },
          ),
        );

        if (response.statusCode == 200) {
          AccessToken accessToken = AccessToken.fromJson(response.data);

          final Response userResponse = await Dio().post(
            "https://api.github.com/graphql",
            data: '{"query": "query { viewer { login, avatarUrl, name }}"}',
            options: Options(
              headers: {
                "Authorization": "bearer ${accessToken.accessToken}",
              },
            ),
          );

          if (userResponse.statusCode == 200) {
            User user = User.fromJson(userResponse.data["data"]["viewer"]);

            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            await sharedPreferences.setString(
              "accessToken",
              jsonEncode(accessToken.toJson()),
            );

            await sharedPreferences.setString(
              "user",
              jsonEncode(user.toJson()),
            );

            return true;
          }
        }
      }

      return false;
    } catch (e) {
      print("Auth Error: $e");
      return false;
    }
  }
}
