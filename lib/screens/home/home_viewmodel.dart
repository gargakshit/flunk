import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/git_data.dart';
import '../../models/user.dart';
import '../../services/data/data_service.dart';

class HomeViewModel extends GetxController {
  GQLData _gqlData;
  GQLData get gqlData => _gqlData;

  User _user;
  User get user => _user;

  loadUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user");

    _user = User.fromJson(jsonDecode(data));

    update();
  }

  loadGitData() async {
    DataService dataService = Get.find<DataService>();

    _gqlData = await dataService.getAllData();

    update();
  }
}