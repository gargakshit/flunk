import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (model) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg3.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  model.user != null
                      ? Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(64),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    model.user.avatarUrl,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.user.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "@${model.user.login}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : CircularProgressIndicator(),
                  Expanded(
                    child: Center(
                      child: TypewriterAnimatedTextKit(
                        text: [
                          "FIRING UP THE PUNK...",
                          "PLEASE WAIT...",
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        speed: Duration(milliseconds: 250),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          letterSpacing: 2,
                          color: Colors.white,
                          fontFamily: "Blanka",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
