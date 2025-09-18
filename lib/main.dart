import 'package:csi_attendance/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:csi_attendance/api/api_service.dart';
import 'package:csi_attendance/controllers/main_controller.dart'; // Add this import

void main() {
  // Setup dependencies BEFORE running the app
  setupDependencies();
  runApp(const MyApp());
}

void setupDependencies() {
  print("Setting up dependencies...");

  try {
    // Create Dio instance
    final dio = Dio();

    // Configure Dio
    dio.options.connectTimeout = Duration(seconds: 30);
    dio.options.receiveTimeout = Duration(seconds: 30);
    dio.options.headers['Content-Type'] = 'application/json';

    // Add logging interceptor for debugging
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        logPrint: (obj) => print("[API] $obj"),
      ),
    );

    print("Dio configured successfully");

    // Create ApiService instance
    final apiService = ApiService(dio);
    print("ApiService created successfully");

    // Register dependencies with GetX
    Get.put<ApiService>(apiService);
    Get.put<MainController>(MainController(apiService));

    print("Dependencies registered successfully");
  } catch (e, stackTrace) {
    print("ERROR setting up dependencies: $e");
    print("Stack trace: $stackTrace");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CSI Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: HomePage(),
    );
  }
}
