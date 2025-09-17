import 'package:csi_attendance/controllers/main_controller.dart';
import 'package:csi_attendance/pages/login/widgets/rect_button.dart';
import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  MainController controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222222),
        body: GetBuilder<MainController>(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Activity', style: Styles.titleStyle),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RectButton(
                    text: 'Scan',
                    onTap: (text) {
                      controller.onScanTap();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
