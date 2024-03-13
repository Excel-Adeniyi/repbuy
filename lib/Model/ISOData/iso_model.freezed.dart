// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iso_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Iso _$IsoFromJson(Map<String, dynamic> json) {
  return _Iso.fromJson(json);
}

/// @nodoc
mixin _$Iso {
  String get isoName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get continent => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;
  String get currencyName => throw _privateConstructorUsedError;
  String get currencySymbol => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;
  List<String> get callingCodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsoCopyWith<Iso> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsoCopyWith<$Res> {
  factory $IsoCopyWith(Iso value, $Res Function(Iso) then) =
      _$IsoCopyWithImpl<$Res, Iso>;
  @useResult
  $Res call(
      {String isoName,
      String name,
      String continent,
      String currencyCode,
      String currencyName,
      String currencySymbol,
      String flag,
      List<String> callingCodes});
}

/// @nodoc
class _$IsoCopyWithImpl<$Res, $Val extends Iso> implements $IsoCopyWith<$Res> {
  _$IsoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoName = null,
    Object? name = null,
    Object? continent = null,
    Object? currencyCode = null,
    Object? currencyName = null,
    Object? currencySymbol = null,
    Object? flag = null,
    Object? callingCodes = null,
  }) {
    return _then(_value.copyWith(
      isoName: null == isoName
          ? _value.isoName
          : isoName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      callingCodes: null == callingCodes
          ? _value.callingCodes
          : callingCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsoImplCopyWith<$Res> implements $IsoCopyWith<$Res> {
  factory _$$IsoImplCopyWith(_$IsoImpl value, $Res Function(_$IsoImpl) then) =
      __$$IsoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String isoName,
      String name,
      String continent,
      String currencyCode,
      String currencyName,
      String currencySymbol,
      String flag,
      List<String> callingCodes});
}

/// @nodoc
class __$$IsoImplCopyWithImpl<$Res> extends _$IsoCopyWithImpl<$Res, _$IsoImpl>
    implements _$$IsoImplCopyWith<$Res> {
  __$$IsoImplCopyWithImpl(_$IsoImpl _value, $Res Function(_$IsoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoName = null,
    Object? name = null,
    Object? continent = null,
    Object? currencyCode = null,
    Object? currencyName = null,
    Object? currencySymbol = null,
    Object? flag = null,
    Object? callingCodes = null,
  }) {
    return _then(_$IsoImpl(
      isoName: null == isoName
          ? _value.isoName
          : isoName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      callingCodes: null == callingCodes
          ? _value._callingCodes
          : callingCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IsoImpl implements _Iso {
  const _$IsoImpl(
      {required this.isoName,
      required this.name,
      required this.continent,
      required this.currencyCode,
      required this.currencyName,
      required this.currencySymbol,
      required this.flag,
      required final List<String> callingCodes})
      : _callingCodes = callingCodes;

  factory _$IsoImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsoImplFromJson(json);

  @override
  final String isoName;
  @override
  final String name;
  @override
  final String continent;
  @override
  final String currencyCode;
  @override
  final String currencyName;
  @override
  final String currencySymbol;
  @override
  final String flag;
  final List<String> _callingCodes;
  @override
  List<String> get callingCodes {
    if (_callingCodes is EqualUnmodifiableListView) return _callingCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_callingCodes);
  }

  @override
  String toString() {
    return 'Iso(isoName: $isoName, name: $name, continent: $continent, currencyCode: $currencyCode, currencyName: $currencyName, currencySymbol: $currencySymbol, flag: $flag, callingCodes: $callingCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsoImpl &&
            (identical(other.isoName, isoName) || other.isoName == isoName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.continent, continent) ||
                other.continent == continent) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            const DeepCollectionEquality()
                .equals(other._callingCodes, _callingCodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isoName,
      name,
      continent,
      currencyCode,
      currencyName,
      currencySymbol,
      flag,
      const DeepCollectionEquality().hash(_callingCodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsoImplCopyWith<_$IsoImpl> get copyWith =>
      __$$IsoImplCopyWithImpl<_$IsoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsoImplToJson(
      this,
    );
  }
}

abstract class _Iso implements Iso {
  const factory _Iso(
      {required final String isoName,
      required final String name,
      required final String continent,
      required final String currencyCode,
      required final String currencyName,
      required final String currencySymbol,
      required final String flag,
      required final List<String> callingCodes}) = _$IsoImpl;

  factory _Iso.fromJson(Map<String, dynamic> json) = _$IsoImpl.fromJson;

  @override
  String get isoName;
  @override
  String get name;
  @override
  String get continent;
  @override
  String get currencyCode;
  @override
  String get currencyName;
  @override
  String get currencySymbol;
  @override
  String get flag;
  @override
  List<String> get callingCodes;
  @override
  @JsonKey(ignore: true)
  _$$IsoImplCopyWith<_$IsoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
