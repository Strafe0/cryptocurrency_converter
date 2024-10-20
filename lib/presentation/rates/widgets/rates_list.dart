import 'package:cryptocurrency_converter/presentation/rates/notifier/rates_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RatesList extends StatelessWidget {
  const RatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RatesNotifier>(
      builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: notifier.currencies!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(notifier.currencies![index].symbol),
                        Expanded(
                          child: Text(
                            '\$${notifier.currencies![index].rate.toString()}',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    if (index != notifier.currencies!.length - 1)
                      const Divider(),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
