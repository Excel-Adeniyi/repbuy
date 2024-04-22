import 'package:freezed_annotation/freezed_annotation.dart';
part 'utility_model.freezed.dart';
part 'utility_model.g.dart';

@freezed
class UtilityModel with _$UtilityModel {
  const factory UtilityModel({
    required int utilityId,
    required String name,
    required String countryCode,
    required String serviceType,
    required String minInternationalTransactionAmount,
    required String maxInternationalTransactionAmount,
  }) = _UtilityModel;

  factory UtilityModel.fromJson(Map<String, dynamic> json) => _$UtilityModelFromJson(json);
}
