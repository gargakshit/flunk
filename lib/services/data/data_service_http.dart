import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_service.dart';
import '../../constants/query.dart';
import '../../models/access_token.dart';
import '../../models/git_data.dart';

GQLData parseData(dynamic json) {
  return GQLData.fromJson(json);
}

class DataServiceHttp implements DataService {
  @override
  Future<GQLData> getAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String authData = sharedPreferences.getString("accessToken");
    AccessToken accessToken = AccessToken.fromJson(jsonDecode(authData));

    final Response response = await Dio().post(
      "https://api.github.com/graphql",
      data: allQuery,
      options: Options(
        headers: {
          "Authorization":
              "${accessToken.tokenType} ${accessToken.accessToken}",
        },
      ),
    );

    if (response.statusCode == 200) {
      GQLData data = await compute(parseData, response.data);
      print(data.data.viewer.repositories.totalCount);

      return data;
    } else {
      print("Error fetching data: ${response.data}");
      throw "Error fetching data";
    }
  }
}
