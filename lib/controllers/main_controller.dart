import 'package:csi_attendance/api/attendance_request.dart';
import 'package:csi_attendance/widgets/info_bs.dart';
import 'package:get/get.dart';
import 'package:csi_attendance/pages/home/home.dart';
import 'package:csi_attendance/pages/qrscan/qr_scan.dart';
import 'package:csi_attendance/api/api_service.dart'; // <-- import your Retrofit service

class MainController extends GetxController {
  bool _isBSopen = false;

  final ApiService api; // ApiService instance

  MainController(this.api);

  void onLogin(String email, String password) {
    print("Login tapped with email: $email");
    Get.to(() => HomePage());
    print("Navigated to HomePage");
  }

  void onScanTap() {
    print("Scan button tapped");
    Get.to(() => QRScanPage());
    print("Navigated to QRScanPage");
  }

  Future<void> onQRdetect(String regId) async {
    if (regId.isEmpty) {
      print("Error: QR code is empty");
      return;
    }
    try {
      if (_isBSopen) return;
      _isBSopen = true;
      final user = await api.fetchUserByRegId(AttendanceRequest(regId: regId));
      Get.bottomSheet(
        InfoBottomSheet(user: user),
        isScrollControlled: true,
      ).then((value) {
        _isBSopen = false;
      });
    } catch (e) {
      print("Error fetching user from backend: $e");
    }
  }
}
