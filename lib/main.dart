import 'package:cryptocurrency_converter/data/providers/currency_provider.dart';
import 'package:cryptocurrency_converter/data/providers/currency_provider_impl.dart';
import 'package:cryptocurrency_converter/data/repositories/currency_repository.dart';
import 'package:cryptocurrency_converter/data/repositories/currency_repository_impl.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  CurrencyProvider currencyProvider = CurrencyProviderImpl();
  CurrencyRepository currencyRepo = CurrencyRepositoryImpl(currencyProvider);
  GetCurrencies getCurrencies = GetCurrencies(currencyRepo);

  runApp(
    App(
      getCurrencies: getCurrencies,
    ),
  );
}
