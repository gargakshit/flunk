import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/colors.dart';
import 'services/locator.dart';
import 'screens/home/home_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';

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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: authenticated(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return HomeScreen();
            } else {
              return OnboardingScreen();
            }
          }

          return Container();
        },
      ),
    );
  }
}
