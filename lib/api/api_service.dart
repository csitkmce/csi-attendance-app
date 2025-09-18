import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'attendance_request.dart';
import 'user_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://csi-backend.vercel.app")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/api/app/attendance/scan")
  Future<UserResponse> fetchUserByRegId(@Body() AttendanceRequest request);

  @POST("/api/app/attendance/mark")
  Future<AttendanceResponse> markAttendance(@Body() AttendanceRequest request);
}
