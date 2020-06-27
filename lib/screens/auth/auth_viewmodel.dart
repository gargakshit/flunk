import 'package:get/get.dart';

import '../../widgets/home_wrapper.dart';
import '../../services/auth/auth_service.dart';

class AuthViewModel extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  authenticate() async {
    _isLoading = true;
    update();

    AuthService authService = Get.find<AuthService>();
    await authService.authenticate();

    _isLoading = false;
    update();

    Get.offAll(HomeWrapper());
  }
}
