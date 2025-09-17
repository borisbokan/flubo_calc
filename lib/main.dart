import 'package:flubo_package/flubo_package.dart';

void main() {
  List<double> pricesList = [1890.0, 560.0, 780.0, 256.0, 1450.0];

  // pricesList.forEach((item) {
  //   final calItem = PriceCalculation(startValue: item, gain: 20);
  //   calItem.calculate();

  //   print(calItem.toString());
  // });

  // var perFromVal = PercentCalulations(
  //   mainValue: 1450,
  //   amount: null,
  //   percent: 24,
  // );
  // perFromVal.calculate();
  // print(perFromVal.toString());

  pricesList.forEach((item) {
    final calItem = PercentCalulations(
      mainValue: item,
      percent: 13,
      amount: null,
    );
    calItem.calculate();

    print(calItem.toString());
  });
}
