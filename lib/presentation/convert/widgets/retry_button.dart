import 'package:cryptocurrency_converter/presentation/convert/notifier/convert_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<ConvertNotifier>().convert(),
      child: Text('Retry'),
    );
  }
}
