import 'package:freezed_annotation/freezed_annotation.dart';

part 'signinModel.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required String userdata,
    required String password,
  }) = _User;
}
