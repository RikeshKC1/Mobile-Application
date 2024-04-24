class ArithmeticModel {
  final int first;
  final int second;

  ArithmeticModel({
    required this.first,
    required this.second,
  });

  // Add
  int add() {
    return first + second;
  }

  // Subtract
  int subtract() {
    return first - second;
  }

  // Multiply
  int multiply() {
    return first * second;
  }

  // Divide
  double divide() {
    if (second == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return first / second;
  }
}
