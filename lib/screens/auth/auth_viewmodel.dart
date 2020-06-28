import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../../services/auth/auth_service.dart';

class AuthViewModel extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  authenticate(BuildContext context) async {
    _isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 1));

    AuthService authService = Get.find<AuthService>();
    bool authenticated = await authService.authenticate();

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    update();

    if (authenticated) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
        (route) => false,
      );
    }
  }
}
