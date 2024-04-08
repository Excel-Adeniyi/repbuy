import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class GoogleService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          "194963140155-scudc2ih2ffqivpmob58o08nnm9nh7pt.apps.googleusercontent.com",
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]);
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  Future<Response<dynamic>> googleAuth() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final String email = googleSignInAccount!.email;
      final String name = googleSignInAccount.displayName ?? "";

      if (email != null) {
        final userData = {email, name};
        print(userData);
        final response =
            await dio.post('/googleSignUp', options: Options(), data: userData);
        Get.toNamed('/dashboard');
        print(response);
        return response;
      }
      throw Exception('Email is null');
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
