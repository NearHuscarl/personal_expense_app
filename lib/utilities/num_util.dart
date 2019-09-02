import 'dart:math';

class NumUtil {
  static double round(double val, int fractionDigits) {
    double mod = pow(10.0, fractionDigits);
    return ((val * mod).round().toDouble() / mod);
  }
}
