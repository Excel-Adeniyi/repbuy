import 'package:freezed_annotation/freezed_annotation.dart';

part 'iso_model.freezed.dart';
part 'iso_model.g.dart';

@freezed
class Iso with _$Iso {
  const factory Iso({
    required String isoName,
    required String name,
    required String continent,
    required String currencyCode,
    required String currencyName,
    required String currencySymbol,
    required String flag,
    required List<String> callingCodes,
  }) = _Iso;

  factory Iso.fromJson(Map<String, dynamic> json) => _$IsoFromJson(json);
}
