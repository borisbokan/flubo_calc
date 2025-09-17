class PercentCalulations {
  double? _mainValue;
  double? _amount;
  double? _percent;

  static final PercentCalulations _instance = PercentCalulations._internal(
    mainValue: 0,
  );

  PercentCalulations._internal({
    required double mainValue,
    double? amount,
    double? percent,
  });

  factory PercentCalulations({
    required double mainValue,
    required double? amount,
    double? percent,
  }) {
    _instance._mainValue = mainValue;
    _instance._amount = amount;
    _instance._percent = percent;

    return _instance;
  }

  void calculate() {
    if (_amount != null && _percent != null) {
      throw Exception(
        'You cant calculate bouth, percent from value and value from percent in the same time!\nEnter mainValue and only one of two: percent or amount.One must be null',
      );
    } else if (_amount != null) {
      _percent = (_amount! / _mainValue!) * 100;
    } else if (_percent != null) {
      _amount = _mainValue! * (_percent! / 100);
    } else {}
  }

  double? get getMainValue => _mainValue;
  double? get getAmount => _amount;
  double? get getPercent => _percent;

  @override
  String toString() {
    if (_percent != null) {
      return "Result in procent: ${getPercent?.toStringAsFixed(2)}% for amount: ${getAmount!.toStringAsFixed(2)} from main value $getMainValue";
    }
    if (_amount != null) {
      return "Result value is: ${getAmount?.toStringAsFixed(2)} from percent of $getPercent from $getMainValue";
    }
    return "No result!";
  }
}
