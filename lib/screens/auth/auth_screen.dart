import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_viewmodel.dart';
import '../../constants/colors.dart';
import '../../widgets/parallelogram_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (model) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg3.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Fl",
                      style: TextStyle(
                        color: gradient1Left,
                        fontSize: 44.0,
                        fontFamily: "Riviera",
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      "unk",
                      style: TextStyle(
                        color: gradient1Right,
                        fontSize: 40.0,
                        fontFamily: "Blanka",
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                        color: gradient1Left,
                        fontSize: 44.0,
                        fontFamily: "Blanka",
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Bit and Punks",
                  style: TextStyle(
                    color: gradient1Left,
                    fontSize: 28.0,
                    fontFamily: "Riviera",
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ParallelogramButton(
                  onTap: model.isLoading
                      ? null
                      : () => model.authenticate(context),
                  width: 280,
                  child: model.isLoading
                      ? Center(
                          child: TypewriterAnimatedTextKit(
                            text: [
                              "LOADING...",
                            ],
                            speed: Duration(milliseconds: 500),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15.0,
                              letterSpacing: 2,
                            ),
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SIGNIN ",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              "WITH GITHUB",
                              style: TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
