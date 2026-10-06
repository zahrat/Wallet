import 'package:wallet_info/asset_list.dart';
import 'package:wallet_info/constants/arguments.dart';
import 'package:wallet_info/data/services/wallet_service.dart';
import 'package:wallet_info/models/wallet.dart';
import 'package:wallet_info/transactions_list.dart';
import 'package:wallet_info/utils/split_arguments.dart';
import 'extensions/number_extension.dart';

void getInfo(List<String> arguments) async {
  final argMap = splitArguments(arguments);

  final WalletServiceImp walletService = WalletServiceImp(
    address: argMap[Arguments.address.name] ?? "",
  );

  final Wallet? wallet = await walletService.fetchWalletInfo();

  if (wallet != null) {
    print('--- WALLET ---');
    print('Address:\n ${wallet.address}');
    print('Portfolio Value:\n ${(wallet.portfolioValue).separateByComma()}');
    assetList(wallet.assets);
    final transactions = await walletService.fetchTransactions(
      currency: argMap[Arguments.byCurrency.name],
      byStatus: argMap[Arguments.byStatus.name],
      dateSort: argMap[Arguments.dateSort.name],
    );

    transactionList(transactions ?? [], wallet.address);
  }
}
