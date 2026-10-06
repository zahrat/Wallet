import 'package:wallet_info/models/transaction.dart';
import 'package:wallet_info/utils/is_received.dart';
import 'extensions/number_extension.dart';

void transactionList(List<Transaction> transactions, String currentAddress) {
  if (transactions.isNotEmpty) {
    print('---------------\nTransactions:');
    for (var transaction in transactions) {
      print(
        '${isReceiver(currentAddress, transaction.to) ? 'RECEIVE' : 'SEND'} ${transaction.currency.name.toUpperCase()} ${transaction.value.separateByComma()}',
      );
      print(transaction.status.name);
      print(transaction.date.toLocal());
    }
  } else {
    print('---------------\n No Transaction Exists');
  }
}
