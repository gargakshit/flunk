import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screenshot/screenshot.dart';

import 'remix_viewmodel.dart';
import '../../widgets/gradient_appbar.dart';
import '../../widgets/parallelogram_button.dart';

class RemixScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemixViewModel>(
      init: RemixViewModel(),
      builder: (model) => Scaffold(
        backgroundColor: Color(0xff1B0536),
        body: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(
              //     "assets/images/bg3.jpg",
              //   ),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Column(
            children: [
              GradientAppBar(
                title: "REMIX",
                color1: Color(0xff6D0B60),
                color2: Color(0xffFF21B7),
                action: FlatButton(
                  onPressed: () {
                    if (model.selectedImageUrl != "") model.next();
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              model.loading
                  ? Expanded(
                      child: Center(
                        child: TypewriterAnimatedTextKit(
                          text: [
                            "SOMETHING AWESOME",
                            "IS WAITING",
                            "FOR YOU",
                          ],
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          speed: Duration(milliseconds: 150),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontFamily: "Blanka",
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: model.selectedImageUrl == ""
                          ? ParallelogramButton(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "SELECT ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15.0,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    "A PHOTO",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => model.selectImage(),
                              width: 280,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Screenshot(
                                  controller: model.screenshotController,
                                  child: ClipRRect(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              40,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            "assets/images/remix${model.currentBg}.png",
                                            fit: BoxFit.cover,
                                          ),
                                          PhotoView(
                                            imageProvider: NetworkImage(
                                              model.selectedImageUrl,
                                            ),
                                            basePosition: Alignment.center,
                                            backgroundDecoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FlatButton(
                                  onPressed: () => model.selectImage(),
                                  child: Text(
                                    "CHANGE IMAGE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                    ),
              Expanded(
                child: Container(),
              ),
              (model.selectedImageUrl == "" || model.loading)
                  ? Container()
                  : Column(
                      children: [
                        Text(
                          "Please select a background",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: [1, 2, 3, 4, 5, 6, 7, 8]
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      model.setBg(e);
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/remix$e.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}