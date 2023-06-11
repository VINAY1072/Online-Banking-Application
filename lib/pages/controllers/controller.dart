import 'package:bank_app/pages/controllers/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isPathSet = false.obs;
  var profpicpath = "".obs;
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPass(email, password);
  }

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPass(email, password);
  }

  void logoutUser() {
    AuthenticationRepository.instance.logout();
  }

  void setprofimagepath(String path) {
    profpicpath.value = path;
    isPathSet.value = true;
  }
}
