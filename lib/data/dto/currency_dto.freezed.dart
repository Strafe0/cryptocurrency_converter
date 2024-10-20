// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) {
  return _CurrencyDto.fromJson(json);
}

/// @nodoc
mixin _$CurrencyDto {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  String get rateUsd => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this CurrencyDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyDtoCopyWith<CurrencyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyDtoCopyWith<$Res> {
  factory $CurrencyDtoCopyWith(
          CurrencyDto value, $Res Function(CurrencyDto) then) =
      _$CurrencyDtoCopyWithImpl<$Res, CurrencyDto>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String? currencySymbol,
      String rateUsd,
      String type});
}

/// @nodoc
class _$CurrencyDtoCopyWithImpl<$Res, $Val extends CurrencyDto>
    implements $CurrencyDtoCopyWith<$Res> {
  _$CurrencyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? currencySymbol = freezed,
    Object? rateUsd = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      rateUsd: null == rateUsd
          ? _value.rateUsd
          : rateUsd // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyDtoImplCopyWith<$Res>
    implements $CurrencyDtoCopyWith<$Res> {
  factory _$$CurrencyDtoImplCopyWith(
          _$CurrencyDtoImpl value, $Res Function(_$CurrencyDtoImpl) then) =
      __$$CurrencyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String? currencySymbol,
      String rateUsd,
      String type});
}

/// @nodoc
class __$$CurrencyDtoImplCopyWithImpl<$Res>
    extends _$CurrencyDtoCopyWithImpl<$Res, _$CurrencyDtoImpl>
    implements _$$CurrencyDtoImplCopyWith<$Res> {
  __$$CurrencyDtoImplCopyWithImpl(
      _$CurrencyDtoImpl _value, $Res Function(_$CurrencyDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? currencySymbol = freezed,
    Object? rateUsd = null,
    Object? type = null,
  }) {
    return _then(_$CurrencyDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: freezed == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      rateUsd: null == rateUsd
          ? _value.rateUsd
          : rateUsd // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyDtoImpl implements _CurrencyDto {
  const _$CurrencyDtoImpl(
      {required this.id,
      required this.symbol,
      this.currencySymbol,
      required this.rateUsd,
      required this.type});

  factory _$CurrencyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String? currencySymbol;
  @override
  final String rateUsd;
  @override
  final String type;

  @override
  String toString() {
    return 'CurrencyDto(id: $id, symbol: $symbol, currencySymbol: $currencySymbol, rateUsd: $rateUsd, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.rateUsd, rateUsd) || other.rateUsd == rateUsd) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, symbol, currencySymbol, rateUsd, type);

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyDtoImplCopyWith<_$CurrencyDtoImpl> get copyWith =>
      __$$CurrencyDtoImplCopyWithImpl<_$CurrencyDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyDtoImplToJson(
      this,
    );
  }
}

abstract class _CurrencyDto implements CurrencyDto {
  const factory _CurrencyDto(
      {required final String id,
      required final String symbol,
      final String? currencySymbol,
      required final String rateUsd,
      required final String type}) = _$CurrencyDtoImpl;

  factory _CurrencyDto.fromJson(Map<String, dynamic> json) =
      _$CurrencyDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String? get currencySymbol;
  @override
  String get rateUsd;
  @override
  String get type;

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyDtoImplCopyWith<_$CurrencyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
