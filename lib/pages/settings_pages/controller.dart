import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isPathSet = false.obs;
  var profpicpath = "".obs;

  void setprofimagepath(String path) {
    profpicpath.value = path;
    isPathSet.value = true;
  }
}
