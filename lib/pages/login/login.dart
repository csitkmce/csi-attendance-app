import 'package:csi_attendance/api/api_service.dart';
import 'package:csi_attendance/controllers/main_controller.dart';
import 'package:csi_attendance/pages/login/widgets/form_input_field.dart';
import 'package:csi_attendance/pages/login/widgets/rect_button.dart';
import 'package:csi_attendance/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // ✅ Create Dio + ApiService
  final dio = Dio();
  late final apiService = ApiService(dio);

  // ✅ Inject MainController with ApiService
  late final MainController controller = Get.put(MainController(apiService));

  // ✅ Proper controllers (don’t create new inside FormFieldInput)
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222222),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Admin Login', style: Styles.titleStyle),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF444444),
                        border: Border.all(color: Colors.black),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Form(
                        child: Column(
                          children: [
                            FormFieldInput(
                              controller: new TextEditingController(),
                              hintText: 'Email',
                            ),
                            SizedBox(height: 10),
                            FormFieldInput(
                              controller: new TextEditingController(),
                              hintText: 'Password',
                            ),
                            SizedBox(height: 10),
                            RectButton(
                              onTap: (text) {
                                controller.onLogin(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                              text: 'Login',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
