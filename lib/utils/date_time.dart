DateTime convertMilisecondsToDateTime(int miliseconds) {
  if (miliseconds.isNaN) return DateTime.now();
  return DateTime.fromMillisecondsSinceEpoch(miliseconds);
}
