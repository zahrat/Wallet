import 'package:wallet_info/constants/currency.dart';
import 'package:wallet_info/utils/date_time.dart';

import '../constants/status.dart';

class Transaction {
  Transaction({
    required this.from,
    required this.to,
    required this.value,
    required this.currency,
    required this.status,
    required this.date,
  });
  String from;
  String to;
  double value;
  Currency currency;
  Status status;
  DateTime date;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final date = convertMilisecondsToDateTime(json['date']);

    return Transaction(
      from: json['from'] as String,
      to: json['to'] as String,
      value: double.parse(json['value'].toString()),

      status: Status.values.firstWhere(
        (e) => e.name.toLowerCase() == json['status'].toLowerCase(),
        orElse: () => Status.pending,
      ),

      currency: Currency.values.firstWhere(
        (e) => e.name.toLowerCase() == json['currency'].toLowerCase(),
        orElse: () => Currency.eth,
      ),
      date: date,
    );
  }
}
