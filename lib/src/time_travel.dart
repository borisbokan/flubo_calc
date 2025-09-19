/// Aauthor: Boris Bokan
/// Date: 18.09.2025.
/// Design type is singlton
class TimeTravel {
  double destination;
  double speed;
  double? _rawTravelTime;
  String? hour;
  String? min;

  static final TimeTravel _instance = TimeTravel._internal(
    destination: 0,
    speed: 0,
  );

  TimeTravel._internal({required this.destination, required this.speed});

  factory TimeTravel({required double destination, required double speed}) {
    _instance.destination = destination;
    _instance.speed = speed;
    _instance.calculate();
    return _instance;
  }

  void calculate() {
    _rawTravelTime = destination / speed;
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
