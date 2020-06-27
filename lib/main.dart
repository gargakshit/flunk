import 'package:Flunk/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/auth/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupLocator();

    return GetMaterialApp(
      title: "Flunk",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              AuthService authService = Get.find<AuthService>();
              print(await authService.authenticate());
            },
            child: Text("Login with github"),
          ),
        ),
      ),
    );
  }
}
