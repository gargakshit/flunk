import 'package:get/get.dart';

import 'auth/auth_service.dart';
import 'auth/auth_service_oauth.dart';
import 'data/data_service.dart';
import 'data/data_service_http.dart';

void setupLocator() {
  Get.lazyPut<AuthService>(() => AuthServiceOAuth());
  Get.lazyPut<DataService>(() => DataServiceHttp());
}
