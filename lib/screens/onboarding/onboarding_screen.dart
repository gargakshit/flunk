import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../auth/auth_screen.dart';
import '../../constants/colors.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        [
          PageViewModel(
            pageColor: primaryBg,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Fl",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 32.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "unk",
                  style: TextStyle(
                    color: gradient1Right,
                    fontSize: 32.0,
                    fontFamily: "Blanka",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  ".",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 34.0,
                    fontFamily: "Blanka",
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bits a",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "nd Punks",
                  style: TextStyle(
                    color: gradient1Right,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            mainImage: Image.asset(
              "assets/images/icon.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          PageViewModel(
            pageColor: primaryBg,
            title: Text(
              "Analyze your GitHub profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 2,
              ),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bits a",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "nd Punks",
                  style: TextStyle(
                    color: gradient1Right,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            mainImage: Image.asset(
              "assets/images/ob2.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          PageViewModel(
            pageColor: primaryBg,
            title: Text(
              "Analyze your GitHub profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 2,
              ),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bits a",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "nd Punks",
                  style: TextStyle(
                    color: gradient1Right,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            mainImage: Image.asset(
              "assets/images/ob3.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          PageViewModel(
            pageColor: primaryBg,
            title: Column(
              children: [
                Text(
                  "Remix your profile photo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  "Click on the profile photo for the remixer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bits a",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "nd Punks",
                  style: TextStyle(
                    color: gradient1Right,
                    fontSize: 18.0,
                    fontFamily: "Riviera",
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            mainImage: Image.asset(
              "assets/images/ob1.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
        ],
        showSkipButton: true,
        onTapDoneButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ), //MaterialPageRoute
          );
        },
      ),
    );
  }
}
