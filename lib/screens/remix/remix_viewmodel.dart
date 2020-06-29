import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' hide Color, Image;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/random_string.dart';

class RemixViewModel extends GetxController {
  String _selectedImageUrl = "";
  String get selectedImageUrl => _selectedImageUrl;

  bool _loading = false;
  bool get loading => _loading;

  int _currentBg = 1;
  int get currentBg => _currentBg;

  ScreenshotController screenshotController = ScreenshotController();

  double _opacity = 0.9;
  double get opacity => _opacity;

  setOpacity(double opacity) {
    _opacity = opacity;
    update();
  }

  next() async {
    File scrot = await screenshotController.capture(
      pixelRatio: 3,
    );

    if ((Platform.isAndroid && await Permission.storage.request().isGranted) ||
        Platform.isIOS) {
      await ImageGallerySaver.saveImage(
        scrot.readAsBytesSync(),
        quality: 100,
        name: randomString(
          length: 24,
        ),
      );

      Get.dialog(
        AlertDialog(
          title: Text(
            "Image saved to gallery",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff1B0536),
          actions: [
            FlatButton(
              onPressed: () async {
                Get.back();

                String url = "https://github.com/settings/profile";
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              child: Text(
                "Apply it on GitHub",
                style: TextStyle(
                  color: Color(0xffFF21B7),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Color(0xffFF21B7),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  setBg(int i) {
    _currentBg = i;
    update();
  }

  selectImage() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      Get.dialog(
        AlertDialog(
          backgroundColor: Color(0xff1B0536),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xffFF21B7),
                ),
              ),
            ),
            FlatButton(
              onPressed: () async {
                _loading = true;
                update();

                Get.back();

                CloudinaryPublic cloudinary = CloudinaryPublic(
                  'flunk-hack20',
                  'obiinijl',
                  cache: false,
                );

                File resizedImage = File("${pickedFile.path}.resized.png")
                  ..writeAsBytesSync(
                    encodePng(
                      copyResize(
                        decodeImage(await pickedFile.readAsBytes()),
                        width: 1024,
                      ),
                    ),
                  );

                CloudinaryResponse response = await cloudinary.uploadFile(
                  CloudinaryFile.fromFile(
                    resizedImage,
                    resourceType: CloudinaryResourceType.Image,
                  ),
                );

                Response httpResponse = await Dio().getUri(
                  Uri.http(
                    "104.211.158.139:3009",
                    "bg",
                    {
                      "url": response.secureUrl,
                    },
                  ),
                );

                if (httpResponse.statusCode == 200 &&
                    httpResponse.data.toString() != "") {
                  _selectedImageUrl = httpResponse.data.toString();
                } else {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: Color(0xff1B0536),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Color(0xffFF21B7),
                            ),
                          ),
                        ),
                      ],
                      title: Text(
                        "Looks like some error while processing, please try later.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }

                _loading = false;
                update();
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Color(0xffFF21B7),
                ),
              ),
            ),
          ],
          content: Center(
            child: Image.file(
              File(pickedFile.path),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Are you sure?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}
