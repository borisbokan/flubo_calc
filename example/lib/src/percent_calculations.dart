/// Handle amount value in percents anf vice versa.
///
///
///
/// Aauthor: Boris Bokan
/// Date: 18.09.2025.
/// Design type is singlton
class PercentCalulations {
  double? _mainValue;
  double? _amount;
  double? _percent;
  String? _typeOfCalk;

  static final PercentCalulations _instance = PercentCalulations._internal(
    mainValue: 0,
  );

  PercentCalulations._internal({double? mainValue});

  factory PercentCalulations({
    required double mainValue,
    double? amount,
    double? percent,
  }) {
    _instance._mainValue = mainValue;
    _instance._amount = amount;
    _instance._percent = percent;
    if (amount != null) {
      _instance._typeOfCalk = "amount";
    }
    if (percent != null) {
      _instance._typeOfCalk = "percent";
    }
    _instance.calculate();
    return _instance;
  }

  void calculate() {
    if (_amount != null && _percent != null) {
      throw Exception(
        'You cant calculate bouth, percent from value and value from percent in the same time!\nEnter mainValue and only one of two: percent or amount.One must be null',
      );
    }
    if (_typeOfCalk == "amount") {
      _percent = (_amount! / _mainValue!) * 100;
    }
    if (_typeOfCalk == "percent") {
      _amount = _mainValue! * (_percent! / 100);
    }
  }

  double? get getMainValue => _mainValue;
  double? get getAmount => _amount;
  double? get getPercent => _percent;

  @override
  String toString() {
    if (_typeOfCalk == "amount") {
      return "Percent value ${_percent?.toStringAsFixed(2)}% for given value $_amount, main value is $getMainValue";
    }
    if (_typeOfCalk == "percent") {
      return "Result value: ${getAmount?.toStringAsFixed(2)} from percent value $_percent%,  main value is $getMainValue";
    }
    return "No result!";
  }
}
