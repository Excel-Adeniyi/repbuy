// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilityModelImpl _$$UtilityModelImplFromJson(Map<String, dynamic> json) =>
    _$UtilityModelImpl(
      utilityId: json['utilityId'] as int,
      name: json['name'] as String,
      countryCode: json['countryCode'] as String,
      serviceType: json['serviceType'] as String,
      minInternationalTransactionAmount:
          json['minInternationalTransactionAmount'] as String,
      maxInternationalTransactionAmount:
          json['maxInternationalTransactionAmount'] as String,
    );

Map<String, dynamic> _$$UtilityModelImplToJson(_$UtilityModelImpl instance) =>
    <String, dynamic>{
      'utilityId': instance.utilityId,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'serviceType': instance.serviceType,
      'minInternationalTransactionAmount':
          instance.minInternationalTransactionAmount,
      'maxInternationalTransactionAmount':
          instance.maxInternationalTransactionAmount,
    };
