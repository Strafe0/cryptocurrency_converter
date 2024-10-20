import 'package:cryptocurrency_converter/domain/entities/currency/currency.dart';
import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:cryptocurrency_converter/presentation/rates/notifier/rates_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCurrencyButton extends StatelessWidget {
  const SelectCurrencyButton({super.key, required this.from});

  final bool from;

  @override
  Widget build(BuildContext context) {
    String buttonText = 'Not selected';
    ConvertNotifier notifier = context.watch<ConvertNotifier>();

    if (from && notifier.currencyFrom != null) {
      buttonText = notifier.currencyFrom!.symbol;
    } else if (!from && notifier.currencyTo != null) {
      buttonText = notifier.currencyTo!.symbol;
    }

    return OutlinedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            List<Currency>? currencies =
                context.read<RatesNotifier>().currencies;

            if (currencies != null && currencies.isNotEmpty) {
              return ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Center(child: Text(currencies[index].symbol)),
                    onTap: () {
                      if (from) {
                        notifier.currencyFrom = currencies[index];
                      } else {
                        notifier.currencyTo = currencies[index];
                      }
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }

            return Center(child: const Text('Failed to get currencies'));
          },
        );
      },
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size.fromWidth(
            MediaQuery.sizeOf(context).width,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.only(left: 16, right: 8)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(buttonText)),
          Icon(Icons.arrow_drop_down_outlined),
        ],
      ),
    );
  }
}
