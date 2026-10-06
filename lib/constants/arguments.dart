enum Arguments { address, dateSort, byCurrency, byStatus }

extension HasMemeberInArguments on String {
  bool includesString() {
    return Arguments.values.toString().contains(this);
  }
}
