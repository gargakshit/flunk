import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'auth_service.dart';
import '../../constants/config.dart';
import '../../models/access_token.dart';
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

      if (resultState == state) {
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
          print(accessToken.accessToken);

          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
