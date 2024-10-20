import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmountTextField extends StatefulWidget {
  const AmountTextField({super.key});

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        validator: (String? value) {
          if (value == null) {
            return 'Fill in the field';
          } else if (Decimal.tryParse(value) == null) {
            return 'Invalid value';
          }

          return null;
        },
        onFieldSubmitted: (String? value) {
          bool? validated = _formKey.currentState?.validate();

          if (validated == true) {
            if (value != null) {
              Decimal? amount = Decimal.tryParse(value);
              context.read<ConvertNotifier>().amount = amount;
            }
          }
        },
      ),
    );
  }
}
