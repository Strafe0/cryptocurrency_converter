import 'package:cryptocurrency_converter/data/dto/currency_dto.dart';
import 'package:decimal/decimal.dart';

enum CurrencyType {
  fiat, crypto
}

class Currency {
  Currency(this.id, this.symbol, this.rate, this.type);

  final String id;
  final String symbol;
  final Decimal rate;
  final CurrencyType type;

  factory Currency.fromDto(CurrencyDto dto) {
    return Currency(
      dto.id,
      dto.symbol,
      Decimal.parse(dto.rateUsd),
      dto.type == 'crypto' ? CurrencyType.crypto : CurrencyType.fiat,
    );
  }
}