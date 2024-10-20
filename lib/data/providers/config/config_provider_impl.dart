import 'package:cryptocurrency_converter/data/providers/config/config_provider.dart';

class ConfigProviderImpl implements ConfigProvider {
  @override
  Future<double> getExchangeCommissionRate() {
    return Future.value(3);
  }

  @override
  Future<int> getUpdateCurrencyPeriod() async {
    return Future.value(30);
  }
}