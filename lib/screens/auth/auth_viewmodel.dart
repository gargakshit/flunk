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

    AuthService authService = Get.find<AuthService>();
    await authService.authenticate();

    _isLoading = false;
    update();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }
}
