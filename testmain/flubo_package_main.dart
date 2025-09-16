import 'package:flubo_package/flubo_package.dart';

void main() {
  try {
    PriceCalculation result = PriceCalculation(
      startValue: 13500,
      gain: 25,
      discount: null,
      tax: null,
    );
    result.calculate();

    print(result.toString());
  } catch (e) {
    print(e);
  }
}
