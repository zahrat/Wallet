import 'package:wallet_info/models/transaction.dart';
import 'package:wallet_info/models/wallet.dart';
import 'package:wallet_info/utils/read_json.dart';
import 'package:wallet_info/extensions/enum_has_member.dart';

abstract interface class WalletService {
  Future<Wallet?> fetchWalletInfo();
  Future<List<Transaction>?> fetchTransactions({
    String? currency,
    String? dateSort,
  });
}

class WalletServiceImp implements WalletService {
  final String address;
  WalletServiceImp({required this.address});

  @override
  Future<Wallet?> fetchWalletInfo() async {
    final Wallet? wallet = await readJsonFile('lib/constants/data.json');

    if (wallet?.address == address) {
      return wallet;
    }
    return null;
  }

  @override
  Future<List<Transaction>?> fetchTransactions({
    String? currency,
    String? dateSort,
    String? byStatus,
  }) async {
    final Wallet? wallet = await readJsonFile('lib/constants/data.json');

    if (wallet?.address == address) {
      var transactions = wallet?.transactions ?? [];

      if (transactions.isEmpty) return [];

      if (currency != null && currency.currencyIncludesString()) {
        transactions = transactions
            .where((transaction) => transaction.currency.name == currency)
            .toList();
      }

      if (dateSort != null && (dateSort == "ASC" || dateSort == "DESC")) {
        transactions.sort(
          (a, b) => dateSort == "DESC"
              ? a.date.compareTo(b.date)
              : b.date.compareTo(a.date),
        );
      }

      if (byStatus != null && byStatus.statusIncludesString()) {
        transactions = transactions
            .where((transaction) => transaction.status.name == byStatus)
            .toList();
      }

      return transactions;
    }

    return null;
  }
}
