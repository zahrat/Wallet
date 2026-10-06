extension NumberExtension on double {
  String separateByComma() {
    final List<String> numArray = toString().split(".");
    String separatedValue = numArray[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

    return "$separatedValue${int.parse(numArray[1]) > 0 ? '.${numArray[1]}' : ''}";
  }
}
