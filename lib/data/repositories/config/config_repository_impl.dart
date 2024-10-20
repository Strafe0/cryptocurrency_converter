import 'package:cryptocurrency_converter/data/providers/config/config_provider.dart';
import 'package:cryptocurrency_converter/data/repositories/config/config_repository.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  ConfigRepositoryImpl(this._configProvider);

  final ConfigProvider _configProvider;

  @override
  Future<double> getExchangeCommissionRate() async {
    return _configProvider.getExchangeCommissionRate();
  }

  @override
  Future<Duration> getUpdateCurrencyPeriod() async {
    int periodInSeconds = await _configProvider.getUpdateCurrencyPeriod();

    return Duration(seconds: periodInSeconds);
  }
}
