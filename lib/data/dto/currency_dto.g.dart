// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyDtoImpl _$$CurrencyDtoImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyDtoImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      currencySymbol: json['currencySymbol'] as String?,
      rateUsd: json['rateUsd'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$CurrencyDtoImplToJson(_$CurrencyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'currencySymbol': instance.currencySymbol,
      'rateUsd': instance.rateUsd,
      'type': instance.type,
    };
