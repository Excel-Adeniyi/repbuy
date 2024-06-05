import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/extractor/extract_session.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class CsrfService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final csptoken = Env.cspkey;
  Future<Response<dynamic>> get() async {
// Obtain shared preferences.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print("TOKEN: $csptoken");
      final payload = {'csptoken': csptoken};
      final response = await dio.post('/ctoken', data: payload);
      // print(options);
      // print("HELLO ${response.data['success']}");
      // final List<dynamic> resData = [];
      if (response.data.containsKey('success')) {
        print("HEADERSSS ${response.headers}");
        if (response.headers['set-cookie'] != null) {
          final List<String> setCookieHeader = response.headers['set-cookie']!;
          // String sessionCookie = extractCookieSession(setCookieHeader);
          print("COOKIESESSION ${setCookieHeader[0]}");
          await stora.writeSecureData('sid', setCookieHeader[0]);
        }
        // print("HI");
        await stora.writeSecureData("X-csrf", response.data['message']);
      } else {
        print('NAN');
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
