import 'package:flubo_package/src/price_calculation.dart';

void main() {
  var res1 = PriceCalculation(startValue: 1200, gain: 25, discount: 20);
  res1.calculate();

  print(res1.toString());
}
