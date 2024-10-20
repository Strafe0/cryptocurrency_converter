import 'package:cryptocurrency_converter/domain/usecases/convert_currency.dart';
import 'package:cryptocurrency_converter/domain/usecases/get_currencies.dart';
import 'package:cryptocurrency_converter/domain/usecases/login_user.dart';
import 'package:cryptocurrency_converter/presentation/auth/notifier/auth_notifier.dart';
import 'package:cryptocurrency_converter/presentation/auth/widgets/auth_screen.dart';
import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:cryptocurrency_converter/presentation/convert/widgets/convert_page.dart';
import 'package:cryptocurrency_converter/presentation/rates/notifier/rates_notifier.dart';
import 'package:cryptocurrency_converter/presentation/rates/widgets/rates_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'home_widget.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.getCurrencies,
    required this.updatePeriod,
    required this.convertCurrency,
    required this.loginUser,
  });

  final GetCurrencies getCurrencies;
  final ConvertCurrency convertCurrency;
  final Duration updatePeriod;
  final LoginUser loginUser;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier(loginUser)),
        ChangeNotifierProvider(
          create: (_) => RatesNotifier(getCurrencies, updatePeriod)
            ..getCurrencies(
              force: true,
            ),
        ),
        ChangeNotifierProvider(create: (_) => ConvertNotifier(convertCurrency)),
      ],
      child: MaterialApp(
        home: const HomeWidget(),
      ),
    );
  }
}
