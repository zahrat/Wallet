import 'package:wallet_info/constants/arguments.dart';

Map<String, String> splitArguments(List<String> arguments) {
  final Map<String, String> args = {};

  for (var element in arguments) {
    var parts = element.split("=");
    if ((parts[0]).includesString()) {
      args[parts[0]] = parts[1];
    }
  }

  return args;
}
