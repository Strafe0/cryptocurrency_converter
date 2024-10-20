import 'dart:async';

import 'package:cryptocurrency_converter/data/providers/config/config_provider.dart';
import 'package:cryptocurrency_converter/data/providers/config/config_provider_impl.dart';
import 'package:cryptocurrency_converter/data/providers/currency/currency_provider.dart';
import 'package:cryptocurrency_converter/data/providers/currency/currency_provider_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/config/config_repository.dart';
import 'package:cryptocurrency_converter/data/repositories/config/config_repository_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository.dart';
import 'package:cryptocurrency_converter/data/repositories/currency/currency_repository_impl.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:cryptocurrency_converter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      CurrencyProvider currencyProvider = CurrencyProviderImpl();
      ConfigProvider configProvider = ConfigProviderImpl();

      CurrencyRepository currencyRepo =
          CurrencyRepositoryImpl(currencyProvider);
      ConfigRepository configRepo = ConfigRepositoryImpl(configProvider);

      GetCurrencies getCurrencies = GetCurrencies(currencyRepo);
      Duration updatePeriod = await configRepo.getUpdateCurrencyPeriod();

      runApp(
        App(
          getCurrencies: getCurrencies,
          updatePeriod: updatePeriod,
        ),
      );
    },
    (e, s) {
      logger.e('Capture error from zone', error: e, stackTrace: s);
    },
  );
}
