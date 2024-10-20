import 'package:cryptocurrency_converter/data/repositories/config/config_repository.dart';
import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/convert_result.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:decimal/decimal.dart';

class ConvertCurrency {
  ConvertCurrency(this._currencyRepository, this._configRepository);

  final CurrencyRepository _currencyRepository;
  final ConfigRepository _configRepository;

  Future<ConvertResult?> convert(
    String currencyIdFrom,
    String currencyIdTo,
    Decimal amount,
  ) async {
    Currency? from = await _currencyRepository.getCurrencyById(currencyIdFrom);
    Currency? to = await _currencyRepository.getCurrencyById(currencyIdTo);

    if (from != null && to != null) {
      Decimal exchangeRate = (from.rate / to.rate).toDecimal(
        scaleOnInfinitePrecision: 18,
      );

      double commission = await _configRepository.getExchangeCommissionRate();
      Decimal exchangeRateWithCommission = exchangeRate *
          (Decimal.one -
              (Decimal.parse(commission.toString()) / Decimal.fromInt(100))
                  .toDecimal());

      Decimal resultWithCommission = amount * exchangeRateWithCommission;
      Decimal resultWithoutCommission = amount * exchangeRate;

      return ConvertResult(
        resultWithoutCommission,
        resultWithCommission,
        commission,
      );
    } else {
      logger.e('Failed to convert - some of currencies is null');
      return null;
    }
  }
}
