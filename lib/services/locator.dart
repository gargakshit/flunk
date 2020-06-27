import 'package:get/get.dart';

import 'auth/auth_service.dart';
import 'auth/auth_service_oauth.dart';

void setupLocator() {
  Get.lazyPut<AuthService>(() => AuthServiceOAuth());
}
