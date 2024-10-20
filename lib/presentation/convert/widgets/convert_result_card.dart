import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConvertResultCard extends StatelessWidget {
  const ConvertResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<ConvertNotifier>();

    Widget child = Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Fill in the fields'),
      ),
    );

    if (notifier.errorMessage != null) {
      child = Center(child: Text(notifier.errorMessage!));
    } else if (notifier.enoughData) {
      child = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_getCurrencyFromText(notifier)),
            const Icon(Icons.arrow_downward),
            if (notifier.convertResult != null)
              Text(_getConvertResultWithCommissionText(notifier)),
            if (notifier.convertResult != null)
              Text(_getConvertResultWithoutCommissionText(notifier)),
            if (notifier.convertResult == null)
              const CircularProgressIndicator(),
          ],
        ),
      );
    }

    return Card(
      child: child,
    );
  }

  String _getCurrencyFromText(ConvertNotifier notifier) {
    String amountText = '0';
    String currencyFrom = '';
    if (notifier.amount != null) {
      amountText = notifier.amount!.toString();
    }
    if (notifier.currencyFrom != null) {
      currencyFrom = ' ${notifier.currencyFrom!.symbol}';
    }

    return '$amountText$currencyFrom';
  }

  String _getConvertResultWithCommissionText(ConvertNotifier notifier) {
    return '${notifier.convertResultWithCommission} '
        '${notifier.currencyTo?.symbol}';
  }

  String _getConvertResultWithoutCommissionText(ConvertNotifier notifier) {
    return '(${notifier.convertResultWithoutCommission} '
        '${notifier.currencyTo?.symbol} - '
        '${notifier.convertResult?.commission}%)';
  }
}
