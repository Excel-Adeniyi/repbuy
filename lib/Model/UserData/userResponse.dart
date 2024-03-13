import 'package:json_annotation/json_annotation.dart';

part 'userResponse.g.dart';

@JsonSerializable()
class UserResponse {
  final String first_name;
  final String last_name;
  final String country;
  final String email;
  final String phone_number;

  UserResponse({
    required this.first_name,
    required this.last_name,
    required this.country,
    required this.email,
    required this.phone_number,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
