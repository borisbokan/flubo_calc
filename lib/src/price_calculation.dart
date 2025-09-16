class PriceCalculation {
  double startValue;
  double? gain;
  double? discount;
  double? tax;
  double? _gainValue;
  double? _result = 0.0;
  double? _taxValue = 0.0;
  double? _discountValue = 0.0;

  PriceCalculation({
    required this.startValue,
    this.gain,
    this.discount,
    this.tax,
  });

  void calculate() {
    if (gain != null) {
      if (discount != null || tax != null) {
        throw Exception(
          'If you entered gain value you can\'t calculate price with discount and tax!\n You must remove discount value or tax if you calculate price with gain!',
        );
      }
      _gainValue = (startValue * gain!) / 100;
      _result = startValue + _gainValue!;
    } else if (discount == null && tax != null) {
      //If have entered tax without discount
      _taxValue = (startValue * tax!) / 100;
      _result = startValue + _taxValue!;
    } else if (discount != null && tax == null) {
      //if we have entered discount without tax
      _discountValue = (startValue * discount!) / 100;
      _result = startValue - _discountValue!;
    } else {
      //if we have entered discount and tax
      // Discount first, then tax
      _discountValue = (startValue * discount!) / 100;
      final discountedPrice = startValue - _discountValue!;
      _taxValue = (discountedPrice * tax!) / 100;
      _result = discountedPrice + _taxValue!;
    }
  }

  double? get getResult => _result;
  double? get getDiscountValue => _discountValue;
  double? get getDtaxValue => _taxValue;
  double? get getGainValue => _gainValue;

  @override
  String toString() {
    if (gain != null && gain! > 0) {
      return "New form price from base price $startValue calculate with gains procent of $gain%. Result value is:  $_result";
    } else {
      return "New form price from base price $startValue result value is: $_result\n>Discount value is: $_discountValue\n>Tax value is: $_taxValue";
    }
  }
}
