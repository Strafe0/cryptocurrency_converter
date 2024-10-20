import 'dart:async';

import 'package:cryptocurrency_converter/data/providers/config/config_provider_impl.dart';
import 'package:cryptocurrency_converter/data/providers/currency/currency_provider_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/config/config_repository_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository_impl.dart';
import 'package:cryptocurrency_converter/domain/usecases/convert_currency.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:cryptocurrency_converter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      final currencyProvider = CurrencyProviderImpl();
      final configProvider = ConfigProviderImpl();

      final currencyRepo = CurrencyRepositoryImpl(currencyProvider);
      final configRepo = ConfigRepositoryImpl(configProvider);

      final getCurrencies = GetCurrencies(currencyRepo);
      final updatePeriod = await configRepo.getUpdateCurrencyPeriod();

      final convertCurrency = ConvertCurrency(currencyRepo, configRepo);

      runApp(
        App(
          getCurrencies: getCurrencies,
          updatePeriod: updatePeriod,
          convertCurrency: convertCurrency,
        ),
      );
    },
    (e, s) {
      logger.e('Capture error from zone', error: e, stackTrace: s);
    },
  );
}
