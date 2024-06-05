import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class GiftCardAuth {
  static BaseOptions options = BaseOptions(
      baseUrl: Constants.base_url,
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3));
  Dio dio = Dio(options);

  Future<Response<dynamic>> auth() async {
    try {
      final response = await dio.post("/authGiftCard");
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }
}
