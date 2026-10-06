import 'package:wallet_info/constants/currency.dart';
import 'package:wallet_info/data/services/currency_service.dart';
import 'package:wallet_info/models/asset.dart';

double getPriceByCurrency(Currency currency, double balance) {
  try {
    switch (currency) {
      case Currency.eth:
        return CurrencyService.fetchEthCurrentPrice() * balance;
      case Currency.usdt:
        return CurrencyService.fetchUsdtPrice() * balance;
      case Currency.btc:
        return CurrencyService.fetchBtcCurrentPrice() * balance;
    }
  } catch (e) {
    return 1;
  }
}

double getPortfoliValue(List<Asset> assets) {
  double portfolioValue = 0;
  for (var asset in assets) {
    portfolioValue += asset.value;
  }
  return portfolioValue;
}
