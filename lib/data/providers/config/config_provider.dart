abstract class ConfigProvider {
  Future<double> getExchangeCommissionRate();
  Future<int> getUpdateCurrencyPeriod();
}