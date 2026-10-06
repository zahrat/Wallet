extension DateTimeCmp on DateTime {
  bool isEarlierDate(DateTime other) {
    return millisecondsSinceEpoch > other.millisecondsSinceEpoch;
  }
}
