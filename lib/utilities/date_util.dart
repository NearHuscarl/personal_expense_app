class DateUtil {
  static DateTime floorToDay(DateTime d) {
    return d.subtract(Duration(
      hours: d.hour,
      minutes: d.minute,
      seconds: d.second,
      milliseconds: d.millisecond,
      microseconds: d.microsecond,
    ));
  }

  static DateTime ceillingToDay(DateTime d) {
    return d.add(Duration(
      hours: 23 - d.hour,
      minutes: 59 - d.minute,
      seconds: 59 - d.second,
      milliseconds: 999 - d.millisecond,
      microseconds: 1000 - d.microsecond,
    ));
  }
}
