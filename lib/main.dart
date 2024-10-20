import 'dart:async';

import 'package:cryptocurrency_converter/data/providers/currency_provider.dart';
import 'package:cryptocurrency_converter/data/providers/currency_provider_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/currency_repository.dart';
import 'package:cryptocurrency_converter/data/repositories/currency_repository_impl.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:cryptocurrency_converter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () {
      CurrencyProvider currencyProvider = CurrencyProviderImpl();
      CurrencyRepository currencyRepo =
          CurrencyRepositoryImpl(currencyProvider);
      GetCurrencies getCurrencies = GetCurrencies(currencyRepo);

      runApp(
        App(
          getCurrencies: getCurrencies,
        ),
      );
    },
    (e, s) {
      logger.e('Capture error from zone', error: e, stackTrace: s);
    },
  );
}
