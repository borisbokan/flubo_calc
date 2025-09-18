import 'package:flubo_package/flubo_package.dart';
import 'package:flubo_package/src/time_travel.dart';

void main() async {
  ///Simple example of using calculations for seling price or gain from some price when we make or form seeling price with our gain.
  List<double> pricesList = [1890.0, 560.0, 780.0, 256.0, 1450.0];

  pricesList.forEach((item) {
    //When we choice to calculate gain of some price value, other argument parameters have to be set to null or you will get exeption
    //You can calculate two types of price , this is the first, belov,  with gain calculation.
    final gain = PriceCalculation(startValue: item, gain: 20);
    gain.calculate();
    print(gain.toString());

    //Second type where we calculate seling price or end price (for seling).
    final sellPirce = PriceCalculation(
      startValue: item,
      discount: 5,
      tax: 20,
      gain: null,
    );
    sellPirce.calculate();
    print(sellPirce.toString());
  });

  /// Simple example of using percent values. Two types of calculation:
  /// 1. When we need percent of some value
  /// 2. When wen need how much procent is from some amount
  var perFromVal = PercentCalulations(
    mainValue: 1450,
    amount: null,
    percent: 24,
  );
  perFromVal.calculate();
  print(perFromVal.toString());

  ///Example 1 - Simple example of using calculations
  var time = TimeTravel(destinationKm: 11860, speed: 450);
  time.calculate();
  print(time.toString());

  ///Exmple 2 of using Time Travel calculation
  List<double> speeds = [85, 90, 105, 120, 80, 60]; //km/h
  List<double> distances = [15, 23, 10, 13, 17, 7]; //km

  for (var i = 0; i < speeds.length; i++) {
    final timeTra = TimeTravel(
      destinationKm: distances[i],
      speed: speeds[i].roundToDouble(),
    );
    timeTra.calculate();
    int h = int.parse(timeTra.hour!);
    double m = (double.parse(timeTra.min!));
    final durationMs = ((h + m) * 1000)
        .round(); //it is simulation some time of duration , it isn't relevant

    print("You are driving now with speed of ${speeds[i]} km/h");
    if (h != 0) {
      print(
        ">you reach ${distances[i]} km distance for ${timeTra.hour}h and ${timeTra.min} min\n",
      );
    } else {
      print(">you reach ${distances[i]} km distance for ${timeTra.min} min\n");
    }
    await Future.delayed(Duration(milliseconds: durationMs));
  }

  print("You arrived!");
}
