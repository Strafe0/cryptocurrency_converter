import 'package:cryptocurrency_converter/domain/entities/currency/convert_result.dart';
import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/domain/usecases/convert_currency.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

class ConvertNotifier extends ChangeNotifier {
  ConvertNotifier(this._convertCurrency);

  final ConvertCurrency _convertCurrency;

  bool _calculationInProgress = false;

  bool get calculationInProgress => _calculationInProgress;

  Currency? _currencyFrom;
  Currency? _currencyTo;
  Decimal? _amount;
  ConvertResult? _result;
  String? _errorMessage;
  double? _commission;

  Currency? get currencyFrom => _currencyFrom;

  Currency? get currencyTo => _currencyTo;

  Decimal? get amount => _amount;

  ConvertResult? get convertResult => _result;

  bool get enoughData =>
      _currencyFrom != null && _currencyTo != null && _amount != null;

  String? get convertResultWithCommission =>
      _currencyTo?.type == CurrencyType.fiat
          ? _result?.withCommission.toStringAsFixed(2)
          : _result?.withCommission.toString();

  String? get convertResultWithoutCommission =>
      _currencyTo?.type == CurrencyType.fiat
          ? _result?.withoutCommission.toStringAsFixed(2)
          : _result?.withCommission.toString();

  double? get commission => _commission;

  String? get errorMessage => _errorMessage;

  set currencyFrom(Currency? currencyFrom) {
    _currencyFrom = currencyFrom;
    convert();
  }

  set currencyTo(Currency? currencyTo) {
    _currencyTo = currencyTo;
    convert();
  }

  set amount(Decimal? amount) {
    _amount = amount;
    convert();
  }

  Future<void> convert() async {
    logger.i('convert $_amount $_currencyFrom to $_currencyTo');

    if (!enoughData) {
      notifyListeners();
      return;
    }

    if (_currencyFrom == _currencyTo) {
      _errorMessage = 'Cannot convert the same currencies';
      notifyListeners();
      return;
    }

    _calculationInProgress = true;
    notifyListeners();

    try {
      _result = await _convertCurrency(
        _currencyFrom!.id,
        _currencyTo!.id,
        _amount!,
      );
      _errorMessage = null;
    } catch (e, s) {
      _errorMessage = 'Failed to convert';
      logger.e(_errorMessage, error: e, stackTrace: s);
    }

    _calculationInProgress = false;
    notifyListeners();
  }

  void clear() {
    _currencyFrom = null;
    _currencyTo = null;
    _amount = null;
    _result = null;
    _errorMessage = null;
    _commission = null;
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}
