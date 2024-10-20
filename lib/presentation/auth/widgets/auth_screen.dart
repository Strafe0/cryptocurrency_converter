import 'package:cryptocurrency_converter/presentation/auth/notifier/auth_notifier.dart';
import 'package:cryptocurrency_converter/presentation/rates/notifier/rates_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextField(
              controller: _loginTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                'Password',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextField(
              controller: _passwordTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _SignInButton(onPressed: _onPressed),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() async {
    bool result = await context.read<AuthNotifier>().login(
          _loginTextController.text,
          _passwordTextController.text,
        );

    if (mounted && result) {
      context.read<RatesNotifier>().getCurrencies(force: true);
    }

    if (!result) {
      setState(() {
        _errorMessage = 'Invalid login or password';
      });
    }
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.onPrimary,
        ),
        fixedSize: WidgetStatePropertyAll(
          Size.fromWidth(MediaQuery.sizeOf(context).width),
        ),
      ),
      child: const Text('Sign in'),
    );
  }
}
