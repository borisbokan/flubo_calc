class TimeTravel {
  double destinationKm;
  double speed;
  double? _rawTravelTime;
  String? hour;
  String? min;

  static final TimeTravel _instance = TimeTravel._internal(
    destinationKm: 0,
    speed: 0,
  );

  TimeTravel._internal({required this.destinationKm, required this.speed});

  factory TimeTravel({required double destinationKm, required double speed}) {
    _instance.destinationKm = destinationKm;
    _instance.speed = speed;
    return _instance;
  }

  void calculate() {
    // T = D / Sp
    _rawTravelTime = destinationKm / speed;
    _setClockTime(_rawTravelTime!);
  }

  void _setClockTime(double rawTravelTime) {
    int intPart = rawTravelTime.truncate();
    hour = intPart.toStringAsFixed(2).split(".")[0];
    double decimalVal = rawTravelTime - intPart;
    min = (decimalVal * 60).toStringAsPrecision(2);
  }

  @override
  String toString() {
    if (hour == null || hour == "0.00") {
      return "Travel time $min min";
    } else {
      return "Travel time is $hour h and $min min";
    }
  }
}
