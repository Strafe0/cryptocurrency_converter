import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:cryptocurrency_converter/presentation/convert/widgets/amount_text_field.dart';
import 'package:cryptocurrency_converter/presentation/convert/widgets/convert_result_card.dart';
import 'package:cryptocurrency_converter/presentation/convert/widgets/retry_button.dart';
import 'package:cryptocurrency_converter/presentation/convert/widgets/select_currency_from_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('From', style: Theme.of(context).textTheme.titleMedium),
          SelectCurrencyButton(from: true),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('To', style: Theme.of(context).textTheme.titleMedium),
          ),
          SelectCurrencyButton(from: false),
          const Divider(height: 48),
          Text('Amount', style: Theme.of(context).textTheme.titleMedium),
          const AmountTextField(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: const ConvertResultCard(),
          ),
          if (context.watch<ConvertNotifier>().errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: const RetryButton(),
            ),
        ],
      ),
    );
  }
}
