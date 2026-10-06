import 'package:wallet_info/constants/arguments.dart';
import 'package:wallet_info/constants/currency.dart';
import 'package:wallet_info/constants/status.dart';

extension HasMemeberInEnum on String {
  bool includesString() {
    return Arguments.values.indexWhere(((element) => element.name == this)) > 0;
  }

  bool statusIncludesString() {
    return Status.values.indexWhere(((element) => element.name == this)) > 0;
  }

  bool currencyIncludesString() {
    return Currency.values.indexWhere(((element) => element.name == this)) > 0;
  }
}
