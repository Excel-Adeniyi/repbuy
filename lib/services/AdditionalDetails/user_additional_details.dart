

import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class UserAdditionalInfo{
    static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
}