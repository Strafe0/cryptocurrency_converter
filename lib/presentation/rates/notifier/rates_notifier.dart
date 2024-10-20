import 'dart:async';

import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:flutter/foundation.dart';

class RatesNotifier extends ChangeNotifier {
  RatesNotifier(this._getCurrencies, this.updatePeriod);

  final GetCurrencies _getCurrencies;
  final Duration updatePeriod;

  List<Currency>? _currencies;
  List<Currency>? get currencies => _currencies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Timer? _timer;

  Future<void> getCurrencies({bool force = false}) async {
    logger.d('getCurrencies(force = $force)');
    _isLoading = true;
    notifyListeners();

    _currencies = await _getCurrencies();

    _isLoading = false;
    notifyListeners();

    if (force) {
      _startTimer();
    }
  }

  void _startTimer() async {
    logger.d('start timer');
    _timer?.cancel();
    _timer = Timer.periodic(updatePeriod, (_) {
      logger.d('Update currencies by timer');
      getCurrencies();
    });
  }

  void clear() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}
