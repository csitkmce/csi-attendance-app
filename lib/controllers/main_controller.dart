import 'package:csi_attendance/pages/home/home.dart';
import 'package:csi_attendance/pages/qrscan/qr_scan.dart';
import 'package:csi_attendance/widgets/info_bs.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  void onLogin(String email, String password) {
    Get.to(HomePage());
  }

  void onScanTap() {
    Get.to(QRScanPage());
    // Get.bottomSheet(InfoBottomSheet());
  }

  void onQRdetect() {
    if (!Get.isBottomSheetOpen!) {
      Get.bottomSheet(InfoBottomSheet());
    }
  }
}
