import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PicController extends GetxController {
  var isPathSet = false.obs;
  var profpicpath = "".obs;
  static PicController get instance => Get.find();

  void setprofimagepath(String path) {
    profpicpath.value = path;
    isPathSet.value = true;
  }
}
