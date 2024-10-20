import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onSubmitted: (String? newValue) {
        if (newValue != null) {
          Decimal? amount = Decimal.tryParse(newValue);
          context.read<ConvertNotifier>().amount = amount;
        }
      },
    );
  }
}
