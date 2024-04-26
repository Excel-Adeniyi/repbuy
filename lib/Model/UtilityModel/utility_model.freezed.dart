// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UtilityModel _$UtilityModelFromJson(Map<String, dynamic> json) {
  return _UtilityModel.fromJson(json);
}

/// @nodoc
mixin _$UtilityModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get serviceType => throw _privateConstructorUsedError;
  double get minInternationalTransactionAmount =>
      throw _privateConstructorUsedError;
  double get maxInternationalTransactionAmount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UtilityModelCopyWith<UtilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilityModelCopyWith<$Res> {
  factory $UtilityModelCopyWith(
          UtilityModel value, $Res Function(UtilityModel) then) =
      _$UtilityModelCopyWithImpl<$Res, UtilityModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String countryCode,
      String serviceType,
      double minInternationalTransactionAmount,
      double maxInternationalTransactionAmount});
}

/// @nodoc
class _$UtilityModelCopyWithImpl<$Res, $Val extends UtilityModel>
    implements $UtilityModelCopyWith<$Res> {
  _$UtilityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryCode = null,
    Object? serviceType = null,
    Object? minInternationalTransactionAmount = null,
    Object? maxInternationalTransactionAmount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      minInternationalTransactionAmount: null ==
              minInternationalTransactionAmount
          ? _value.minInternationalTransactionAmount
          : minInternationalTransactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxInternationalTransactionAmount: null ==
              maxInternationalTransactionAmount
          ? _value.maxInternationalTransactionAmount
          : maxInternationalTransactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UtilityModelImplCopyWith<$Res>
    implements $UtilityModelCopyWith<$Res> {
  factory _$$UtilityModelImplCopyWith(
          _$UtilityModelImpl value, $Res Function(_$UtilityModelImpl) then) =
      __$$UtilityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String countryCode,
      String serviceType,
      double minInternationalTransactionAmount,
      double maxInternationalTransactionAmount});
}

/// @nodoc
class __$$UtilityModelImplCopyWithImpl<$Res>
    extends _$UtilityModelCopyWithImpl<$Res, _$UtilityModelImpl>
    implements _$$UtilityModelImplCopyWith<$Res> {
  __$$UtilityModelImplCopyWithImpl(
      _$UtilityModelImpl _value, $Res Function(_$UtilityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryCode = null,
    Object? serviceType = null,
    Object? minInternationalTransactionAmount = null,
    Object? maxInternationalTransactionAmount = null,
  }) {
    return _then(_$UtilityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      minInternationalTransactionAmount: null ==
              minInternationalTransactionAmount
          ? _value.minInternationalTransactionAmount
          : minInternationalTransactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxInternationalTransactionAmount: null ==
              maxInternationalTransactionAmount
          ? _value.maxInternationalTransactionAmount
          : maxInternationalTransactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtilityModelImpl implements _UtilityModel {
  const _$UtilityModelImpl(
      {required this.id,
      required this.name,
      required this.countryCode,
      required this.serviceType,
      required this.minInternationalTransactionAmount,
      required this.maxInternationalTransactionAmount});

  factory _$UtilityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String countryCode;
  @override
  final String serviceType;
  @override
  final double minInternationalTransactionAmount;
  @override
  final double maxInternationalTransactionAmount;

  @override
  String toString() {
    return 'UtilityModel(id: $id, name: $name, countryCode: $countryCode, serviceType: $serviceType, minInternationalTransactionAmount: $minInternationalTransactionAmount, maxInternationalTransactionAmount: $maxInternationalTransactionAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtilityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.minInternationalTransactionAmount,
                    minInternationalTransactionAmount) ||
                other.minInternationalTransactionAmount ==
                    minInternationalTransactionAmount) &&
            (identical(other.maxInternationalTransactionAmount,
                    maxInternationalTransactionAmount) ||
                other.maxInternationalTransactionAmount ==
                    maxInternationalTransactionAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      countryCode,
      serviceType,
      minInternationalTransactionAmount,
      maxInternationalTransactionAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UtilityModelImplCopyWith<_$UtilityModelImpl> get copyWith =>
      __$$UtilityModelImplCopyWithImpl<_$UtilityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtilityModelImplToJson(
      this,
    );
  }
}

abstract class _UtilityModel implements UtilityModel {
  const factory _UtilityModel(
          {required final int id,
          required final String name,
          required final String countryCode,
          required final String serviceType,
          required final double minInternationalTransactionAmount,
          required final double maxInternationalTransactionAmount}) =
      _$UtilityModelImpl;

  factory _UtilityModel.fromJson(Map<String, dynamic> json) =
      _$UtilityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get countryCode;
  @override
  String get serviceType;
  @override
  double get minInternationalTransactionAmount;
  @override
  double get maxInternationalTransactionAmount;
  @override
  @JsonKey(ignore: true)
  _$$UtilityModelImplCopyWith<_$UtilityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
