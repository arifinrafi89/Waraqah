/// Reads the ISBN on the back of a book, from a barcode or typed by hand.
abstract final class Isbn {
  /// The ISBN-13 for [raw] (spaces and dashes are fine; an ISBN-10 is
  /// turned into its ISBN-13), or `null` when it isn't a valid ISBN.
  static String? normalize(String raw) {
    final text = raw.replaceAll(RegExp(r'[\s-]'), '').toUpperCase();
    if (RegExp(r'^\d{13}$').hasMatch(text)) {
      final bookland = text.startsWith('978') || text.startsWith('979');
      return bookland && _check13(text.substring(0, 12)) == text[12]
          ? text
          : null;
    }
    if (RegExp(r'^\d{9}[\dX]$').hasMatch(text)) {
      if (_check10(text.substring(0, 9)) != text[9]) return null;
      final twelve = '978${text.substring(0, 9)}';
      return '$twelve${_check13(twelve)}';
    }
    return null;
  }

  static String _check13(String twelve) {
    var sum = 0;
    for (var i = 0; i < 12; i++) {
      sum += int.parse(twelve[i]) * (i.isEven ? 1 : 3);
    }
    return '${(10 - sum % 10) % 10}';
  }

  static String _check10(String nine) {
    var sum = 0;
    for (var i = 0; i < 9; i++) {
      sum += int.parse(nine[i]) * (10 - i);
    }
    final check = (11 - sum % 11) % 11;
    return check == 10 ? 'X' : '$check';
  }
}
