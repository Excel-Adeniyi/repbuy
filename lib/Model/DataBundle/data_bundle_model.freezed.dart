// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_bundle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Datapackage _$DatapackageFromJson(Map<String, dynamic> json) {
  return _Datapackage.fromJson(json);
}

/// @nodoc
mixin _$Datapackage {
  int get operatorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get destinationCurrencySymbol => throw _privateConstructorUsedError;
  Map<String, dynamic> get country => throw _privateConstructorUsedError;
  List<double> get fixedAmounts => throw _privateConstructorUsedError;
  List<String> get logoUrls => throw _privateConstructorUsedError;
  Map<String, String> get fixedAmountsDescriptions =>
      throw _privateConstructorUsedError;

  /// Serializes this Datapackage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Datapackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatapackageCopyWith<Datapackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatapackageCopyWith<$Res> {
  factory $DatapackageCopyWith(
          Datapackage value, $Res Function(Datapackage) then) =
      _$DatapackageCopyWithImpl<$Res, Datapackage>;
  @useResult
  $Res call(
      {int operatorId,
      String name,
      String? destinationCurrencySymbol,
      Map<String, dynamic> country,
      List<double> fixedAmounts,
      List<String> logoUrls,
      Map<String, String> fixedAmountsDescriptions});
}

/// @nodoc
class _$DatapackageCopyWithImpl<$Res, $Val extends Datapackage>
    implements $DatapackageCopyWith<$Res> {
  _$DatapackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Datapackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorId = null,
    Object? name = null,
    Object? destinationCurrencySymbol = freezed,
    Object? country = null,
    Object? fixedAmounts = null,
    Object? logoUrls = null,
    Object? fixedAmountsDescriptions = null,
  }) {
    return _then(_value.copyWith(
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destinationCurrencySymbol: freezed == destinationCurrencySymbol
          ? _value.destinationCurrencySymbol
          : destinationCurrencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fixedAmounts: null == fixedAmounts
          ? _value.fixedAmounts
          : fixedAmounts // ignore: cast_nullable_to_non_nullable
              as List<double>,
      logoUrls: null == logoUrls
          ? _value.logoUrls
          : logoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fixedAmountsDescriptions: null == fixedAmountsDescriptions
          ? _value.fixedAmountsDescriptions
          : fixedAmountsDescriptions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatapackageImplCopyWith<$Res>
    implements $DatapackageCopyWith<$Res> {
  factory _$$DatapackageImplCopyWith(
          _$DatapackageImpl value, $Res Function(_$DatapackageImpl) then) =
      __$$DatapackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int operatorId,
      String name,
      String? destinationCurrencySymbol,
      Map<String, dynamic> country,
      List<double> fixedAmounts,
      List<String> logoUrls,
      Map<String, String> fixedAmountsDescriptions});
}

/// @nodoc
class __$$DatapackageImplCopyWithImpl<$Res>
    extends _$DatapackageCopyWithImpl<$Res, _$DatapackageImpl>
    implements _$$DatapackageImplCopyWith<$Res> {
  __$$DatapackageImplCopyWithImpl(
      _$DatapackageImpl _value, $Res Function(_$DatapackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Datapackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorId = null,
    Object? name = null,
    Object? destinationCurrencySymbol = freezed,
    Object? country = null,
    Object? fixedAmounts = null,
    Object? logoUrls = null,
    Object? fixedAmountsDescriptions = null,
  }) {
    return _then(_$DatapackageImpl(
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destinationCurrencySymbol: freezed == destinationCurrencySymbol
          ? _value.destinationCurrencySymbol
          : destinationCurrencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      country: null == country
          ? _value._country
          : country // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fixedAmounts: null == fixedAmounts
          ? _value._fixedAmounts
          : fixedAmounts // ignore: cast_nullable_to_non_nullable
              as List<double>,
      logoUrls: null == logoUrls
          ? _value._logoUrls
          : logoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fixedAmountsDescriptions: null == fixedAmountsDescriptions
          ? _value._fixedAmountsDescriptions
          : fixedAmountsDescriptions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatapackageImpl implements _Datapackage {
  const _$DatapackageImpl(
      {required this.operatorId,
      required this.name,
      this.destinationCurrencySymbol,
      required final Map<String, dynamic> country,
      required final List<double> fixedAmounts,
      required final List<String> logoUrls,
      required final Map<String, String> fixedAmountsDescriptions})
      : _country = country,
        _fixedAmounts = fixedAmounts,
        _logoUrls = logoUrls,
        _fixedAmountsDescriptions = fixedAmountsDescriptions;

  factory _$DatapackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatapackageImplFromJson(json);

  @override
  final int operatorId;
  @override
  final String name;
  @override
  final String? destinationCurrencySymbol;
  final Map<String, dynamic> _country;
  @override
  Map<String, dynamic> get country {
    if (_country is EqualUnmodifiableMapView) return _country;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_country);
  }

  final List<double> _fixedAmounts;
  @override
  List<double> get fixedAmounts {
    if (_fixedAmounts is EqualUnmodifiableListView) return _fixedAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fixedAmounts);
  }

  final List<String> _logoUrls;
  @override
  List<String> get logoUrls {
    if (_logoUrls is EqualUnmodifiableListView) return _logoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logoUrls);
  }

  final Map<String, String> _fixedAmountsDescriptions;
  @override
  Map<String, String> get fixedAmountsDescriptions {
    if (_fixedAmountsDescriptions is EqualUnmodifiableMapView)
      return _fixedAmountsDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fixedAmountsDescriptions);
  }

  @override
  String toString() {
    return 'Datapackage(operatorId: $operatorId, name: $name, destinationCurrencySymbol: $destinationCurrencySymbol, country: $country, fixedAmounts: $fixedAmounts, logoUrls: $logoUrls, fixedAmountsDescriptions: $fixedAmountsDescriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatapackageImpl &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.destinationCurrencySymbol,
                    destinationCurrencySymbol) ||
                other.destinationCurrencySymbol == destinationCurrencySymbol) &&
            const DeepCollectionEquality().equals(other._country, _country) &&
            const DeepCollectionEquality()
                .equals(other._fixedAmounts, _fixedAmounts) &&
            const DeepCollectionEquality().equals(other._logoUrls, _logoUrls) &&
            const DeepCollectionEquality().equals(
                other._fixedAmountsDescriptions, _fixedAmountsDescriptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      operatorId,
      name,
      destinationCurrencySymbol,
      const DeepCollectionEquality().hash(_country),
      const DeepCollectionEquality().hash(_fixedAmounts),
      const DeepCollectionEquality().hash(_logoUrls),
      const DeepCollectionEquality().hash(_fixedAmountsDescriptions));

  /// Create a copy of Datapackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatapackageImplCopyWith<_$DatapackageImpl> get copyWith =>
      __$$DatapackageImplCopyWithImpl<_$DatapackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatapackageImplToJson(
      this,
    );
  }
}

abstract class _Datapackage implements Datapackage {
  const factory _Datapackage(
          {required final int operatorId,
          required final String name,
          final String? destinationCurrencySymbol,
          required final Map<String, dynamic> country,
          required final List<double> fixedAmounts,
          required final List<String> logoUrls,
          required final Map<String, String> fixedAmountsDescriptions}) =
      _$DatapackageImpl;

  factory _Datapackage.fromJson(Map<String, dynamic> json) =
      _$DatapackageImpl.fromJson;

  @override
  int get operatorId;
  @override
  String get name;
  @override
  String? get destinationCurrencySymbol;
  @override
  Map<String, dynamic> get country;
  @override
  List<double> get fixedAmounts;
  @override
  List<String> get logoUrls;
  @override
  Map<String, String> get fixedAmountsDescriptions;

  /// Create a copy of Datapackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatapackageImplCopyWith<_$DatapackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
