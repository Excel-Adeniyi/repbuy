// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iso_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsoImpl _$$IsoImplFromJson(Map<String, dynamic> json) => _$IsoImpl(
      isoName: json['isoName'] as String,
      name: json['name'] as String,
      continent: json['continent'] as String,
      currencyCode: json['currencyCode'] as String,
      currencyName: json['currencyName'] as String,
      currencySymbol: json['currencySymbol'] as String,
      flag: json['flag'] as String,
      callingCodes: (json['callingCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$IsoImplToJson(_$IsoImpl instance) => <String, dynamic>{
      'isoName': instance.isoName,
      'name': instance.name,
      'continent': instance.continent,
      'currencyCode': instance.currencyCode,
      'currencyName': instance.currencyName,
      'currencySymbol': instance.currencySymbol,
      'flag': instance.flag,
      'callingCodes': instance.callingCodes,
    };
