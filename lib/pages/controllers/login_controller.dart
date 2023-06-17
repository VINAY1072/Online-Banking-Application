import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_app/pages/controllers/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPass(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }
}
