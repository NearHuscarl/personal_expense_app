import "dart:math";

class RandomUtil {
  static final _rng = new Random();

  static T randomItem<T>(List<T> list) {
    var rndIndex = _rng.nextInt(list.length);
    return list[rndIndex];
  }

  static double randomBetween(double min, double max) {
    return _rng.nextDouble() * (max - min) + min;
  }

  static int randomBetweenInt(int min, int max) {
    return _rng.nextInt(max - min) + min;
  }

  static int randomBetweenLargeInt(int min, int max) {
    return nextLargeInt(max - min) + min;
  }

  static int nextLargeInt(int max) {
    final digits = max.toString().length;
    var result = 0;
    var str = "";

    for (var i = 0; i < digits; i++) {
      str += _rng.nextInt(10).toString();
      final strValue = int.parse(str);

      if (strValue >= max) break;
      result = strValue;
    }

    return result;
  }

  static DateTime randomDate(DateTime min, DateTime max) {
    var minMillisecondsSinceEpoch = min.millisecondsSinceEpoch;
    var maxMillisecondsSinceEpoch = max.millisecondsSinceEpoch;

    return DateTime.fromMillisecondsSinceEpoch(
      randomBetweenLargeInt(
          minMillisecondsSinceEpoch, maxMillisecondsSinceEpoch),
    );
  }
}
