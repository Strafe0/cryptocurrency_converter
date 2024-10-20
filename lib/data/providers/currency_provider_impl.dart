import 'package:cryptocurrency_converter/data/dto/currency_dto.dart';
import 'package:cryptocurrency_converter/data/providers/currency_provider.dart';

class CurrencyProviderImpl implements CurrencyProvider {
  @override
  Future<List<CurrencyDto>?> getCurrencies() async {
    // TODO: implement getCurrencies
    await Future.delayed(Duration(milliseconds: 300));
    return Future.value([
      CurrencyDto.fromJson(
        {
          "id": "bitcoin",
          "symbol": "BTC",
          "currencySymbol": "₿",
          "type": "crypto",
          "rateUsd": "68404.3476028389566611"
        },
      ),
      CurrencyDto.fromJson(
        {
          "id": "russian-ruble",
          "symbol": "RUB",
          "currencySymbol": "₽",
          "type": "fiat",
          "rateUsd": "0.0104380992375772"
        },
      ),
    ]);
  }

  @override
  Future<CurrencyDto?> getCurrencyById(String id) async {
    // TODO: implement getCurrencyById
    throw UnimplementedError();
  }
}
