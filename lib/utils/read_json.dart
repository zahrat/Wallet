import 'dart:convert';
import 'dart:io';

import 'package:wallet_info/models/wallet.dart' show Wallet;

Future<Wallet?> readJsonFile(String filePath) async {
  try {
    var input = await File(filePath).readAsString();
    var json = jsonDecode(input);
    Wallet wallet = Wallet.fromJson(json);
    return wallet;
  } catch (e) {
    return null;
  }
}
