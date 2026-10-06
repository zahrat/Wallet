import 'package:wallet_info/constants/currency.dart';
import 'package:wallet_info/utils/currency_helper.dart';

class Asset {
  Asset({required this.currency, required this.balance, required this.value});
  Currency currency;
  double balance;
  double value;

  factory Asset.fromJson(Map<String, dynamic> json) {
    final currency = Currency.values.firstWhere(
      (e) => e.name.toLowerCase() == json['currency'].toLowerCase(),
      orElse: () => Currency.eth,
    );
    double value = getPriceByCurrency(
      currency,
      double.parse(json['balance'].toString()),
    );

    return Asset(
      currency: currency,
      balance: double.parse(json['balance'].toString()),
      value: value,
    );
  }

  Map<String, dynamic> toJson() => {
    'currency': currency,
    'balance': balance,
    'value': value,
  };
}
