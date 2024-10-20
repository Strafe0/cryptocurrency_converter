import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/presentation/rates/notifier/rates_notifier.dart';
import 'package:cryptocurrency_converter/presentation/rates/widgets/rates_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'home_widget.dart';

class App extends StatelessWidget {
  const App({super.key, required this.getCurrencies});

  final GetCurrencies getCurrencies;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RatesNotifier(getCurrencies)
            ..getCurrencies(
              force: true,
            ),
        ),
      ],
      child: MaterialApp(
        home: const HomeWidget(),
      ),
    );
  }
}
