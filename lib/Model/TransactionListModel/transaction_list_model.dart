import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_list_model.freezed.dart';
part 'transaction_list_model.g.dart';

@freezed
class TransactionListModel with _$TransactionListModel {
  const factory TransactionListModel(
      {required String amount,
      required String ntransactionId,
      required String operatorId,
      required String countryCode,
      required int success,
      required String status,
      required String purchase_type,
      required String updated_at}) = _TransactionListModel;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionListModelFromJson(json);
}

@freezed
class TransactionsListReponse with _$TransactionsListReponse {
  const factory TransactionsListReponse(
      {required dynamic successs,
      required List<TransactionListModel> message}) = _TransactionsListReponse;

  factory TransactionsListReponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListReponseFromJson(json);
}
