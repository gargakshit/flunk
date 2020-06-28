import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../remix/remix_screen.dart';
import '../../models/git_data.dart';
import '../../models/language_data.dart';
import '../../models/monthly_aggregations.dart';
import '../../models/user.dart';
import '../../services/data/data_service.dart';

class HomeViewModel extends GetxController {
  GQLData _gqlData;
  GQLData get gqlData => _gqlData;

  User _user;
  User get user => _user;

  bool _loading = true;
  bool get loading => _loading;

  Map<String, Language> _langData;
  Map<String, Language> get langData => _langData;

  int _totalCommits;
  int get totalCommits => _totalCommits;

  int _totalRepos;
  int get totalRepos => _totalRepos;

  List<MonthlyAggregation> _monthlyData;
  List<MonthlyAggregation> get monthlyData => _monthlyData;

  int _currentMax = 0;
  int get currentMax => _currentMax;

  List<int> _currentData = List();
  List<int> get currentData => _currentData;

  int _currentYear = 2020;
  int get currentYear => _currentYear;

  int _firstYear = 0;
  int get firstYear => _firstYear;

  int _score = 0;
  int get score => _score;

  int _rank = 0;
  int get rank => _rank;

  HomeViewModel() {
    loadUser();
    loadGitData();
  }

  loadUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user");

    _user = User.fromJson(jsonDecode(data));

    update();
  }

  loadGitData() async {
    DataService dataService = Get.find<DataService>();

    _gqlData = await dataService.getAllData();
    _langData = await dataService.languageData(_gqlData);
    _totalRepos = dataService.totalRepos(_gqlData);
    _totalCommits = dataService.totalCommits(_gqlData);
    _monthlyData = await dataService.commitHistory(_gqlData);
    _score = dataService.calculateScore(_totalRepos, _totalCommits);
    _rank = await dataService.getRank(_score);

    _firstYear = DateTime.now().year - ((monthlyData.length / 12).round()) + 1;

    _monthlyData.sublist(_monthlyData.length - 12).forEach((element) {
      _currentData.add(element.commits);
      _currentYear = element.year;

      if (_currentMax < element.commits) _currentMax = element.commits;
    });

    _loading = false;

    update();
  }

  loadDataForYear(int year) {
    _currentData.clear();
    _monthlyData.sublist((year - _firstYear) * 12).forEach((element) {
      _currentData.add(element.commits);

      if (_currentMax < element.commits) _currentMax = element.commits;
    });
    _currentYear = year;

    update();
  }

  offToPunk(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RemixScreen(),
      ),
    );
  }
}
