import 'package:wallet_info/models/asset.dart';
import 'extensions/number_extension.dart';

void assetList(List<Asset> assets) {
  print('Assets:\n');
  for (var asset in assets) {
    print(asset.currency.name.toUpperCase());
    print('Balance: ${asset.balance}');
    print('Value: \$${asset.value.separateByComma()}');
  }
}
