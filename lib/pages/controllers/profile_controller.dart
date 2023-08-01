import 'package:bank_app/pages/models/user_model.dart';
import 'package:bank_app/pages/repository/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/user_repo.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final _email = _authRepo.firebaseUser.value?.email;
    if (_email != null) {
      return _userRepo.getUserDetails(_email);
    } else {
      return Get.snackbar("Error", "Login to continue");
    }
  }

  updateData(UserModel user) async {
    await _userRepo.updateUserDetails(user);
  }
}
