// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airtime_Topup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AirtimeModel {
  String get operatorId => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AirtimeModelCopyWith<AirtimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirtimeModelCopyWith<$Res> {
  factory $AirtimeModelCopyWith(
          AirtimeModel value, $Res Function(AirtimeModel) then) =
      _$AirtimeModelCopyWithImpl<$Res, AirtimeModel>;
  @useResult
  $Res call(
      {String operatorId,
      String amount,
      String countryCode,
      String network,
      String number});
}

/// @nodoc
class _$AirtimeModelCopyWithImpl<$Res, $Val extends AirtimeModel>
    implements $AirtimeModelCopyWith<$Res> {
  _$AirtimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorId = null,
    Object? amount = null,
    Object? countryCode = null,
    Object? network = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirtimeModelImplCopyWith<$Res>
    implements $AirtimeModelCopyWith<$Res> {
  factory _$$AirtimeModelImplCopyWith(
          _$AirtimeModelImpl value, $Res Function(_$AirtimeModelImpl) then) =
      __$$AirtimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operatorId,
      String amount,
      String countryCode,
      String network,
      String number});
}

/// @nodoc
class __$$AirtimeModelImplCopyWithImpl<$Res>
    extends _$AirtimeModelCopyWithImpl<$Res, _$AirtimeModelImpl>
    implements _$$AirtimeModelImplCopyWith<$Res> {
  __$$AirtimeModelImplCopyWithImpl(
      _$AirtimeModelImpl _value, $Res Function(_$AirtimeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorId = null,
    Object? amount = null,
    Object? countryCode = null,
    Object? network = null,
    Object? number = null,
  }) {
    return _then(_$AirtimeModelImpl(
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AirtimeModelImpl implements _AirtimeModel {
  _$AirtimeModelImpl(
      {required this.operatorId,
      required this.amount,
      required this.countryCode,
      required this.network,
      required this.number});

  @override
  final String operatorId;
  @override
  final String amount;
  @override
  final String countryCode;
  @override
  final String network;
  @override
  final String number;

  @override
  String toString() {
    return 'AirtimeModel(operatorId: $operatorId, amount: $amount, countryCode: $countryCode, network: $network, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirtimeModelImpl &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, operatorId, amount, countryCode, network, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirtimeModelImplCopyWith<_$AirtimeModelImpl> get copyWith =>
      __$$AirtimeModelImplCopyWithImpl<_$AirtimeModelImpl>(this, _$identity);
}

abstract class _AirtimeModel implements AirtimeModel {
  factory _AirtimeModel(
      {required final String operatorId,
      required final String amount,
      required final String countryCode,
      required final String network,
      required final String number}) = _$AirtimeModelImpl;

  @override
  String get operatorId;
  @override
  String get amount;
  @override
  String get countryCode;
  @override
  String get network;
  @override
  String get number;
  @override
  @JsonKey(ignore: true)
  _$$AirtimeModelImplCopyWith<_$AirtimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
