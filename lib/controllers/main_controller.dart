import 'package:csi_attendance/pages/home/home.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  void onLogin(String email, String password) {
    Get.to(HomePage());
  }
}
