import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/domain/usecases/convert_currency.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/repositores/config_repository.dart';
import '../../data/repositores/currency_repository_mock.dart';

void main() {
  final currencyRepo = MockCurrencyRepository();
  final configRepo = MockConfigRepository();

  final ConvertCurrency convertCurrency = ConvertCurrency(
    currencyRepo,
    configRepo,
  );

  group('ConvertCurrency', () {
    setUp(() {
      when(() => currencyRepo.getCurrencyById('bitcoin')).thenAnswer(
        (_) => Future.value(Currency(
          'bitcoin',
          'BTC',
          Decimal.parse('68816.7680562322262169171819'), // 22 digits after point
          CurrencyType.crypto,
        )),
      );
      when(() => currencyRepo.getCurrencyById('russian-ruble')).thenAnswer(
        (_) => Future.value(Currency(
          'russian-ruble',
          'RUB',
          Decimal.parse('0.0104380992375772212223'), // 22 digits after point
          CurrencyType.fiat,
        )),
      );
      when(() => configRepo.getExchangeCommissionRate()).thenAnswer(
        (_) => Future.value(3),
      );
    });

    test('convert', () async {
      // arrange
      String currencyFrom = 'bitcoin';
      String currencyTo = 'russian-ruble';
      Decimal amount = Decimal.parse('5');

      // act
      final result = await convertCurrency(currencyFrom, currencyTo, amount);

      Decimal withoutCommission = Decimal.parse('32964223.89264677590429211');
      Decimal withCommission = Decimal.parse('33953150.6094261791814208733');

      // assert
      expect(result!.withoutCommission, equals(withoutCommission));
      expect(result.withCommission, equals(withCommission));
    });
  });
}
