import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_bundle_model.freezed.dart';
part 'data_bundle_model.g.dart';

@freezed
class Datapackage with _$Datapackage {
  const factory Datapackage(
      {required int operatorId,
      required String name,
      String? destinationCurrencySymbol,
      required Map<String, dynamic> country,
      required List<double> fixedAmounts,
      required List<String> logoUrls,
      required Map<String, String> fixedAmountsDescriptions}) = _Datapackage;

  factory Datapackage.fromJson(Map<String, dynamic> json) =>
      _$DatapackageFromJson(json);
}
