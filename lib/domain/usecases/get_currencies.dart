import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';

class GetCurrencies {
  GetCurrencies(this._currencyRepository);

  final CurrencyRepository _currencyRepository;

  Future<List<Currency>?> call() async {
    return await _currencyRepository.getCurrencies();
  }
}