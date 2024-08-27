// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionListModelImpl _$$TransactionListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionListModelImpl(
      amount: json['amount'] as String,
      ntransactionId: json['ntransactionId'] as String,
      operatorId: json['operatorId'] as String,
      countryCode: json['countryCode'] as String,
      success: (json['success'] as num).toInt(),
      status: json['status'] as String,
      purchase_type: json['purchase_type'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$TransactionListModelImplToJson(
        _$TransactionListModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'ntransactionId': instance.ntransactionId,
      'operatorId': instance.operatorId,
      'countryCode': instance.countryCode,
      'success': instance.success,
      'status': instance.status,
      'purchase_type': instance.purchase_type,
      'updated_at': instance.updated_at,
    };

_$TransactionsListReponseImpl _$$TransactionsListReponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionsListReponseImpl(
      successs: json['successs'],
      message: (json['message'] as List<dynamic>)
          .map((e) => TransactionListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionsListReponseImplToJson(
        _$TransactionsListReponseImpl instance) =>
    <String, dynamic>{
      'successs': instance.successs,
      'message': instance.message,
    };
