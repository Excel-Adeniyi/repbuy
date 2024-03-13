import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';

class AirtimeTopupService {
  static BaseOptions options = BaseOptions(
    baseUrl: "http://172.21.67.29:2110",
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
  final Dio dio = Dio(options);

  Future<Response<dynamic>> airtimeReq(AirtimeModel airtimeModel) async {
    print(airtimeModel);
    try {
      final dataReq = {
        "operatorId": airtimeModel.operatorId,
        "amount": airtimeModel.amount,
        "recipientPhone": {
          "countryCode": airtimeModel.countryCode,
          "number": airtimeModel.number
        }
      };
      final response =
          await dio.post('/airtime', options: Options(), data: dataReq);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
