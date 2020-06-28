import 'dart:convert';

import 'package:Flunk/models/language_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_service.dart';
import '../../constants/query.dart';
import '../../models/access_token.dart';
import '../../models/monthly_aggregations.dart';
import '../../models/git_data.dart';

GQLData parseData(dynamic json) {
  return GQLData.fromJson(json);
}

Map<String, Language> aggregateLanguageData(GQLData gqlData) {
  List<RepoEdges> repos = gqlData.data.viewer.repositories.repoEdges;
  Map<String, Language> data = Map();

  repos.forEach((repo) {
    RepoNodes repoNode = repo.repoNodes;

    repoNode.languages.languageEdges.forEach((language) {
      LanguageNode node = language.languageNode;

      if (data.containsKey(node.id)) {
        data[node.id].length++;
      } else {
        Language lang = Language(
          id: node.id,
          name: node.name,
          length: 1,
        );

        data[node.id] = lang;
      }
    });
  });

  Map<String, Language> sortedData = Map();

  List<String> sortedKeys = data.keys.toList(growable: false);
  sortedKeys.sort((k1, k2) => data[k1].length - data[k2].length);
  sortedKeys.reversed.forEach((key) {
    sortedData[key] = data[key];
  });

  return sortedData;
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

  @override
  Future<Map<String, Language>> languageData(GQLData gqlData) async {
    return await compute(aggregateLanguageData, gqlData);
  }
}
