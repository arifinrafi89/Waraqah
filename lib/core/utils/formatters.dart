/// Formatting helpers shared by every price and count in the UI.
abstract final class Bdt {
  static const String symbol = '৳';

  /// `650` -> `৳650`, `12500` -> `৳12,500`.
  static String format(int amount) => '$symbol${_group(amount)}';

  static String _group(int value) {
    final digits = value.abs().toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i != 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return '${value < 0 ? '-' : ''}$buffer';
  }
}

abstract final class Counts {
  static String grouped(int value) => Bdt._group(value);
}
