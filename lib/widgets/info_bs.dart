import 'package:csi_attendance/api/attendance_request.dart';
import 'package:csi_attendance/controllers/main_controller.dart';
import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:csi_attendance/api/user_response.dart';

class InfoBottomSheet extends StatelessWidget {
  final UserResponse user;

  const InfoBottomSheet({super.key, required this.user});

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
            Padding(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: SlideAction(
    text: 'Slide to mark attendance',
    outerColor: Colors.green,
    elevation: 0,
    borderRadius: 10,
    textStyle: Styles.textStyle,
    onSubmit: () async {
      try {
        // Call the backend to mark attendance
        final response = await Get.find<MainController>()
            .api
            .markAttendance(AttendanceRequest(regId: user.id));

        if (response.success) {
          // Show success message
          Get.snackbar(
            "Attendance",
            "Marked present successfully!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade600,
            colorText: Colors.white,
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
    },
  ),
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
