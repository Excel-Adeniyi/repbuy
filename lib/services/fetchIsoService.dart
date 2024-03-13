import 'package:dio/dio.dart';

import '../utils/flutter_storage/flutter_storage.dart';

class FetchISOService {
  static BaseOptions options = BaseOptions(
    baseUrl: "http://172.21.67.29:2110",
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
  final Dio dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  Future<Response<dynamic>> isos() async {
// Obtain shared preferences.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.get('/getios', options: Options());
      print(response);
      // print("HELLO ${response.data['success']}");
      // final List<dynamic> resData = [];
      if (response.data.containsKey('success')) {
        // print("HI");
        // await stora.writeSecureData("X-csrf", response.data['message']);
      } else {
        print('NAN');
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
