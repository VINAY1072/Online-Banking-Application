import 'package:bank_app/base_screen.dart';
import 'package:bank_app/pages/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../login_pages/login_page.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  void verifyOtp(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(() => Base()) : Get.to(() => Scene());
  }
}
