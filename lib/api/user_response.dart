import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String id;
  final String name;
  final String? team;
  final String? food;
  final String? event;
  final String email;
  final String phone;
  final String department;
  final bool present;

  UserResponse({
    required this.id,
    required this.name,
    this.team,
    this.food,
    this.event,
    required this.email,
    required this.phone,
    required this.department,
    required this.present,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

class AttendanceResponse {
  final bool success;
  AttendanceResponse({required this.success});
  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      AttendanceResponse(success: json['success']);
}