// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatapackageImpl _$$DatapackageImplFromJson(Map<String, dynamic> json) =>
    _$DatapackageImpl(
      operatorId: json['operatorId'] as int,
      name: json['name'] as String,
      destinationCurrencySymbol: json['destinationCurrencySymbol'] as String?,
      country: json['country'] as Map<String, dynamic>,
      fixedAmounts: (json['fixedAmounts'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      logoUrls:
          (json['logoUrls'] as List<dynamic>).map((e) => e as String).toList(),
      fixedAmountsDescriptions:
          Map<String, String>.from(json['fixedAmountsDescriptions'] as Map),
    );

Map<String, dynamic> _$$DatapackageImplToJson(_$DatapackageImpl instance) =>
    <String, dynamic>{
      'operatorId': instance.operatorId,
      'name': instance.name,
      'destinationCurrencySymbol': instance.destinationCurrencySymbol,
      'country': instance.country,
      'fixedAmounts': instance.fixedAmounts,
      'logoUrls': instance.logoUrls,
      'fixedAmountsDescriptions': instance.fixedAmountsDescriptions,
    };
