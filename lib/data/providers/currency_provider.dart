import 'package:cryptocurrency_converter/data/dto/currency_dto.dart';

abstract class CurrencyProvider {
  static const String baseUrl = 'api.coincap.io';

  Future<List<CurrencyDto>?> getCurrencies();
  Future<CurrencyDto?> getCurrencyById(String id);
}