import 'package:cryptocurrency_converter/data/dto/currency_dto.dart';
import 'package:cryptocurrency_converter/data/providers/currency/currency_provider.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/logger.dart';

import 'currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  CurrencyRepositoryImpl(this._currencyProvider);

  final CurrencyProvider _currencyProvider;

  @override
  Future<List<Currency>?> getCurrencies() async {
    logger.i('Get currencies');
    List<CurrencyDto>? currencyDtoList =
        await _currencyProvider.getCurrencies();

    if (currencyDtoList != null) {
      try {
        return currencyDtoList.map((dto) => Currency.fromDto(dto)).toList();
      } catch (e, s) {
        logger.e(
          'Failed to convert list of CurrencyDto to list of Currency',
          error: e,
          stackTrace: s,
        );
        return null;
      }
    }

    return null;
  }

  @override
  Future<Currency?> getCurrencyById(String id) async {
    logger.i('Get currency $id');
    CurrencyDto? currencyDto = await _currencyProvider.getCurrencyById(id);

    if (currencyDto != null) {
      try {
        return Currency.fromDto(currencyDto);
      } catch (e, s) {
        logger.e(
          'Failed to convert CurrencyDto to Currency',
          error: e,
          stackTrace: s,
        );
        return null;
      }
    }

    return null;
  }
}
