// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilityModelImpl _$$UtilityModelImplFromJson(Map<String, dynamic> json) =>
    _$UtilityModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      countryCode: json['countryCode'] as String,
      serviceType: json['serviceType'] as String,
      minInternationalTransactionAmount:
          (json['minInternationalTransactionAmount'] as num).toDouble(),
      maxInternationalTransactionAmount:
          (json['maxInternationalTransactionAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$UtilityModelImplToJson(_$UtilityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'serviceType': instance.serviceType,
      'minInternationalTransactionAmount':
          instance.minInternationalTransactionAmount,
      'maxInternationalTransactionAmount':
          instance.maxInternationalTransactionAmount,
    };
