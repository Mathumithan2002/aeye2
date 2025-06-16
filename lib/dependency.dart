import 'package:aeye/screens/face_detection_screen_controller.dart';

import 'package:aeye/screens/settings_controller.dart';

import 'package:get/get.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceDetectionScreenController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
  }
}
