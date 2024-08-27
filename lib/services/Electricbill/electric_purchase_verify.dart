import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class UtilityVerify {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  Future<Response<dynamic>> utilityVerify(int pid) async {
    try {
      final responseData = await dio.get('/utility/verify/$pid');
      print(responseData);
      return responseData;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
