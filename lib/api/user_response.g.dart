// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      team: json['team'] as String?,
      food: json['food'] as String?,
      event: json['event'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      department: json['department'] as String,
      present: json['present'] as bool,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'team': instance.team,
      'food': instance.food,
      'event': instance.event,
      'email': instance.email,
      'phone': instance.phone,
      'department': instance.department,
      'present': instance.present,
    };
