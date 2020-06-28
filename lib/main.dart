import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/colors.dart';
import 'services/locator.dart';
import 'screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> authenticated() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("accessToken");
    print(data);
    return data != null;
  }

  @override
  Widget build(BuildContext context) {
    setupLocator();

    return GetMaterialApp(
      title: "Flunk",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
        canvasColor: primaryBg,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: authenticated(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return HomeScreen();
            } else {
              return AuthScreen();
            }
          }

          return Container();
        },
      ),
    );
  }
}
