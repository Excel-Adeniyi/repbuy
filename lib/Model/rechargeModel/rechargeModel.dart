import 'package:freezed_annotation/freezed_annotation.dart';

part 'rechargeModel.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String value,
    @Default(false) bool isSelected,
  }) = _ImageModel;
}
