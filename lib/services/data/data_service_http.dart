import 'dart:convert';

import 'package:Flunk/models/language_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_service.dart';
import '../../constants/query.dart';
import '../../models/access_token.dart';
import '../../models/git_data.dart';
import '../../models/monthly_aggregations.dart';
import '../../models/user.dart';
import '../../utils/convert.dart';

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

List<MonthlyAggregation> aggregateMonthlyData(GQLData gqlData) {
  DateTime dateOfJoining = DateTime.parse(gqlData.data.viewer.createdAt);
  int yearOfJoining = dateOfJoining.year;

  DateTime now = DateTime.now();
  int yearNow = now.year;

  List<MonthlyAggregation> data = List();

  for (int year = yearOfJoining; year <= yearNow; year++) {
    for (int month = 1; month <= 12; month++) {
      data.add(MonthlyAggregation(
        year: year,
        month: intToMonth(month),
        commits: 0,
      ));
    }
  }

  List<RepoEdges> repos = gqlData.data.viewer.repositories.repoEdges;

  repos.forEach((repo) {
    if (repo.repoNodes.defaultBranchRef != null) {
      List<CommitEdges> commitEdges =
          repo.repoNodes.defaultBranchRef.target.history.commitEdges;

      commitEdges.forEach((commitEdge) {
        CommitNode commitNode = commitEdge.commitNode;

        if (commitNode.authoredDate != null) {
          DateTime commitTime = DateTime.parse(commitNode.authoredDate);

          int item =
              ((commitTime.year - yearOfJoining) * 12) + commitTime.month;
          data[item - 1].commits++;
        }
      });
    }
  });

  return data;
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

  @override
  int totalCommits(GQLData data) {
    return data.data.viewer.repositories.repoEdges.toList().fold<int>(
          0,
          (previousValue, element) =>
              previousValue +
              (element.repoNodes.defaultBranchRef == null
                  ? 0
                  : element
                      .repoNodes.defaultBranchRef.target.history.totalCount),
        );
  }

  @override
  int totalRepos(GQLData data) {
    return data.data.viewer.repositories.totalCount;
  }

  @override
  Future<List<MonthlyAggregation>> commitHistory(GQLData data) async {
    return await compute(aggregateMonthlyData, data);
  }

  @override
  int calculateScore(int repos, int commits) {
    return (commits / repos).round();
  }

  @override
  Future<int> getRank(int score) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userRaw = sharedPreferences.getString("user");
    User user = User.fromJson(jsonDecode(userRaw));

    final Response response = await Dio().post(
      "http://104.211.158.139:3009",
      data: jsonEncode({
        "username": user.login,
        "score": score,
      }),
      options: Options(
        headers: {
          "content-type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      return int.parse(response.data);
    } else {
      print(response.data);
      throw "Error fetching data...";
    }
  }
}
