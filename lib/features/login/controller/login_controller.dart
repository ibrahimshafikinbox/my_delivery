import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  void login({required String email, required String password}) {
    if (!_isValidEmail(email)) {
      _showError("add valid email");
      return;
    }

    if (password.length < 6) {
      _showError("password must be at least 6 char ");
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed('/home');
    });
  }

  bool _isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
