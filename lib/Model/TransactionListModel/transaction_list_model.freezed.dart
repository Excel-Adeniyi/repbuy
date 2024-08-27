// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionListModel _$TransactionListModelFromJson(Map<String, dynamic> json) {
  return _TransactionListModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionListModel {
  String get amount => throw _privateConstructorUsedError;
  String get ntransactionId => throw _privateConstructorUsedError;
  String get operatorId => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  int get success => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get purchase_type => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  /// Serializes this TransactionListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionListModelCopyWith<TransactionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListModelCopyWith<$Res> {
  factory $TransactionListModelCopyWith(TransactionListModel value,
          $Res Function(TransactionListModel) then) =
      _$TransactionListModelCopyWithImpl<$Res, TransactionListModel>;
  @useResult
  $Res call(
      {String amount,
      String ntransactionId,
      String operatorId,
      String countryCode,
      int success,
      String status,
      String purchase_type,
      String updated_at});
}

/// @nodoc
class _$TransactionListModelCopyWithImpl<$Res,
        $Val extends TransactionListModel>
    implements $TransactionListModelCopyWith<$Res> {
  _$TransactionListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? ntransactionId = null,
    Object? operatorId = null,
    Object? countryCode = null,
    Object? success = null,
    Object? status = null,
    Object? purchase_type = null,
    Object? updated_at = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      ntransactionId: null == ntransactionId
          ? _value.ntransactionId
          : ntransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      purchase_type: null == purchase_type
          ? _value.purchase_type
          : purchase_type // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionListModelImplCopyWith<$Res>
    implements $TransactionListModelCopyWith<$Res> {
  factory _$$TransactionListModelImplCopyWith(_$TransactionListModelImpl value,
          $Res Function(_$TransactionListModelImpl) then) =
      __$$TransactionListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      String ntransactionId,
      String operatorId,
      String countryCode,
      int success,
      String status,
      String purchase_type,
      String updated_at});
}

/// @nodoc
class __$$TransactionListModelImplCopyWithImpl<$Res>
    extends _$TransactionListModelCopyWithImpl<$Res, _$TransactionListModelImpl>
    implements _$$TransactionListModelImplCopyWith<$Res> {
  __$$TransactionListModelImplCopyWithImpl(_$TransactionListModelImpl _value,
      $Res Function(_$TransactionListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? ntransactionId = null,
    Object? operatorId = null,
    Object? countryCode = null,
    Object? success = null,
    Object? status = null,
    Object? purchase_type = null,
    Object? updated_at = null,
  }) {
    return _then(_$TransactionListModelImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      ntransactionId: null == ntransactionId
          ? _value.ntransactionId
          : ntransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      purchase_type: null == purchase_type
          ? _value.purchase_type
          : purchase_type // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionListModelImpl implements _TransactionListModel {
  const _$TransactionListModelImpl(
      {required this.amount,
      required this.ntransactionId,
      required this.operatorId,
      required this.countryCode,
      required this.success,
      required this.status,
      required this.purchase_type,
      required this.updated_at});

  factory _$TransactionListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionListModelImplFromJson(json);

  @override
  final String amount;
  @override
  final String ntransactionId;
  @override
  final String operatorId;
  @override
  final String countryCode;
  @override
  final int success;
  @override
  final String status;
  @override
  final String purchase_type;
  @override
  final String updated_at;

  @override
  String toString() {
    return 'TransactionListModel(amount: $amount, ntransactionId: $ntransactionId, operatorId: $operatorId, countryCode: $countryCode, success: $success, status: $status, purchase_type: $purchase_type, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionListModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.ntransactionId, ntransactionId) ||
                other.ntransactionId == ntransactionId) &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchase_type, purchase_type) ||
                other.purchase_type == purchase_type) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, ntransactionId,
      operatorId, countryCode, success, status, purchase_type, updated_at);

  /// Create a copy of TransactionListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionListModelImplCopyWith<_$TransactionListModelImpl>
      get copyWith =>
          __$$TransactionListModelImplCopyWithImpl<_$TransactionListModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionListModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionListModel implements TransactionListModel {
  const factory _TransactionListModel(
      {required final String amount,
      required final String ntransactionId,
      required final String operatorId,
      required final String countryCode,
      required final int success,
      required final String status,
      required final String purchase_type,
      required final String updated_at}) = _$TransactionListModelImpl;

  factory _TransactionListModel.fromJson(Map<String, dynamic> json) =
      _$TransactionListModelImpl.fromJson;

  @override
  String get amount;
  @override
  String get ntransactionId;
  @override
  String get operatorId;
  @override
  String get countryCode;
  @override
  int get success;
  @override
  String get status;
  @override
  String get purchase_type;
  @override
  String get updated_at;

  /// Create a copy of TransactionListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionListModelImplCopyWith<_$TransactionListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionsListReponse _$TransactionsListReponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionsListReponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionsListReponse {
  dynamic get successs => throw _privateConstructorUsedError;
  List<TransactionListModel> get message => throw _privateConstructorUsedError;

  /// Serializes this TransactionsListReponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionsListReponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionsListReponseCopyWith<TransactionsListReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsListReponseCopyWith<$Res> {
  factory $TransactionsListReponseCopyWith(TransactionsListReponse value,
          $Res Function(TransactionsListReponse) then) =
      _$TransactionsListReponseCopyWithImpl<$Res, TransactionsListReponse>;
  @useResult
  $Res call({dynamic successs, List<TransactionListModel> message});
}

/// @nodoc
class _$TransactionsListReponseCopyWithImpl<$Res,
        $Val extends TransactionsListReponse>
    implements $TransactionsListReponseCopyWith<$Res> {
  _$TransactionsListReponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsListReponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successs = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      successs: freezed == successs
          ? _value.successs
          : successs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<TransactionListModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsListReponseImplCopyWith<$Res>
    implements $TransactionsListReponseCopyWith<$Res> {
  factory _$$TransactionsListReponseImplCopyWith(
          _$TransactionsListReponseImpl value,
          $Res Function(_$TransactionsListReponseImpl) then) =
      __$$TransactionsListReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic successs, List<TransactionListModel> message});
}

/// @nodoc
class __$$TransactionsListReponseImplCopyWithImpl<$Res>
    extends _$TransactionsListReponseCopyWithImpl<$Res,
        _$TransactionsListReponseImpl>
    implements _$$TransactionsListReponseImplCopyWith<$Res> {
  __$$TransactionsListReponseImplCopyWithImpl(
      _$TransactionsListReponseImpl _value,
      $Res Function(_$TransactionsListReponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsListReponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successs = freezed,
    Object? message = null,
  }) {
    return _then(_$TransactionsListReponseImpl(
      successs: freezed == successs
          ? _value.successs
          : successs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<TransactionListModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionsListReponseImpl implements _TransactionsListReponse {
  const _$TransactionsListReponseImpl(
      {required this.successs,
      required final List<TransactionListModel> message})
      : _message = message;

  factory _$TransactionsListReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionsListReponseImplFromJson(json);

  @override
  final dynamic successs;
  final List<TransactionListModel> _message;
  @override
  List<TransactionListModel> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  String toString() {
    return 'TransactionsListReponse(successs: $successs, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsListReponseImpl &&
            const DeepCollectionEquality().equals(other.successs, successs) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(successs),
      const DeepCollectionEquality().hash(_message));

  /// Create a copy of TransactionsListReponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsListReponseImplCopyWith<_$TransactionsListReponseImpl>
      get copyWith => __$$TransactionsListReponseImplCopyWithImpl<
          _$TransactionsListReponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionsListReponseImplToJson(
      this,
    );
  }
}

abstract class _TransactionsListReponse implements TransactionsListReponse {
  const factory _TransactionsListReponse(
          {required final dynamic successs,
          required final List<TransactionListModel> message}) =
      _$TransactionsListReponseImpl;

  factory _TransactionsListReponse.fromJson(Map<String, dynamic> json) =
      _$TransactionsListReponseImpl.fromJson;

  @override
  dynamic get successs;
  @override
  List<TransactionListModel> get message;

  /// Create a copy of TransactionsListReponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsListReponseImplCopyWith<_$TransactionsListReponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
