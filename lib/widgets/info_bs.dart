import 'package:csi_attendance/api/attendance_request.dart';
import 'package:csi_attendance/controllers/main_controller.dart';
import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:csi_attendance/api/user_response.dart';

class InfoBottomSheet extends StatelessWidget {
  final UserResponse user;

  const InfoBottomSheet({super.key, required this.user});

  void onSubmitTap() async {
    try {
      // Call the backend to mark attendance
      final response = await Get.find<MainController>().api.markAttendance(
        AttendanceRequest(regId: user.id),
      );

      if (response.success) {
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text("Attendance", style: Styles.textStyle),
            message: "Marked present successfully!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle failure
        Get.snackbar(
          "Attendance",
          "Failed to mark attendance",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error marking attendance: $e");
      Get.snackbar(
        "Attendance",
        "Error marking attendance",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name, style: Styles.titleStyle),
            SizedBox(height: 10),

            // Team
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  user.team ?? 'N/A',
                  style: Styles.textStyle.copyWith(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Food preference
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  user.food ?? 'N/A',
                  style: Styles.textStyle.copyWith(
                    color: (user.food == 'VEG') ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Builder(
              builder: (context) {
                if (!user.present) {
                  return GestureDetector(
                    onTap: () {
                      onSubmitTap();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Mark Present', style: Styles.textStyle),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF606060),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Marked as present', style: Styles.textStyle),
                    ),
                  );
                }
              },
            ),

            SizedBox(height: 10),

            Text('Event Name', style: Styles.smallTextStyle),
            Text(user.event ?? 'N/A', style: Styles.textStyle),
            SizedBox(height: 10),

            Text('Email', style: Styles.smallTextStyle),
            Text(user.email, style: Styles.textStyle),
            SizedBox(height: 10),

            Text('Phone number', style: Styles.smallTextStyle),
            Text(user.phone, style: Styles.textStyle),
            SizedBox(height: 10),

            Text('Department', style: Styles.smallTextStyle),
            Text(user.department, style: Styles.textStyle),
          ],
        ),
      ),
    );
  }
}
