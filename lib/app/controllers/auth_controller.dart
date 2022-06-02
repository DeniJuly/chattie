import 'package:get/get.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  void loginGoogle() {
    Get.offAllNamed('/');
  }
}
