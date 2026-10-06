import 'package:wallet_info/wallet_info.dart' as wallet_info;

void main(List<String> arguments) {
  try {
    wallet_info.getInfo(arguments);
  } catch (e) {
    print("Error: $e");
  }
}
