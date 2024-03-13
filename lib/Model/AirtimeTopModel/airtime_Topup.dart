import 'package:freezed_annotation/freezed_annotation.dart';

part 'airtime_Topup.freezed.dart';

@freezed
class AirtimeModel with _$AirtimeModel {
  factory AirtimeModel(
      {required String operatorId,
      required String amount,
      required String countryCode,
      required String network,
      required String number}) = _AirtimeModel;
}
