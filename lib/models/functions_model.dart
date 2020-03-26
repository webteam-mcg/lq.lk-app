batStrike(int batsmanruns, int ballcount) {
  double batstriked = (batsmanruns * 100 / ballcount);
  double batstikened = double.parse((batstriked).toStringAsFixed(2));
  return batstikened.toString();
}

econ(int bowlerRuns, int balls) {
  double over =
      (balls.toDouble() ~/ 6 + balls.toDouble() % 6.toDouble() / 10.0);
  double econ = (bowlerRuns / over);
  double econEd = double.parse((econ).toStringAsFixed(2));
  return econEd.toString();
}

overs(int balls) {
  double over =
      (balls.toDouble() ~/ 6 + balls.toDouble() % 6.toDouble() / 10.0);
  double overs = double.parse((over).toStringAsFixed(2));
  return overs.toString();
}

strikeRate(int balls, int score) {
  double over =
      (balls.toDouble() ~/ 6 + balls.toDouble() % 6.toDouble() / 10.0);
  double overs = double.parse((over).toStringAsFixed(2));
  double strikeRate = double.parse((score / overs).toStringAsFixed(2));
  return strikeRate.toString();
}
