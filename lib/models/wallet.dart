import 'package:wallet_info/models/asset.dart';
import 'package:wallet_info/models/transaction.dart';
import 'package:wallet_info/utils/currency_helper.dart';

class Wallet {
  Wallet({
    required this.address,
    required this.portfolioValue,
    required this.assets,
    required this.transactions,
  });

  String address;
  double portfolioValue;
  List<Asset> assets;
  List<Transaction> transactions;

  factory Wallet.fromJson(Map<String, dynamic> json) {
    var assetList = json['assets'] as List;
    var transactionList = json['transactions'] as List;
    List<Asset> assets = [];
    List<Transaction> transactions = [];
    try {
      assets = assetList.map((i) => Asset.fromJson(i)).toList();
      transactions = transactionList
          .map((i) => Transaction.fromJson(i))
          .toList();
    } catch (e) {
      print('Error in fromJson wallet model\n $e');
    }

    return Wallet(
      address: json['address'] as String,
      portfolioValue: getPortfoliValue(assets),
      assets: assets,
      transactions: transactions,
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'portfolio_value': portfolioValue,
    'assets': assets,
  };
}
