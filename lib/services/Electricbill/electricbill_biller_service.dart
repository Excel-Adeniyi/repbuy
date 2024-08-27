import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class ElectricBillersService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);

  Future<Response<dynamic>> electricbiller() async {
    try {
      final dynamic response = await dio.get('/utilitybiller');
      print(response);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
