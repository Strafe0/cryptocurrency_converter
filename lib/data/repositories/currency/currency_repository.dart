import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';

abstract class CurrencyRepository {
  Future<List<Currency>?> getCurrencies();
  Future<Currency?> getCurrencyById(String id);
}
