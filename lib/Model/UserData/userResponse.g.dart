// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'country': instance.country,
      'email': instance.email,
      'phone_number': instance.phone_number,
    };
