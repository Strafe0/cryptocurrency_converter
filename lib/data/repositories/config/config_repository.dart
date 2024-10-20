abstract class ConfigRepository {
  Future<double> getExchangeCommissionRate();
  Future<Duration> getUpdateCurrencyPeriod();
}
