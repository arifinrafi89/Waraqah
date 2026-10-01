import 'dart:math';

/// Edits (insert, delete, swap one letter) that turn [a] into [b].
int levenshtein(String a, String b) {
  var prev = List<int>.generate(b.length + 1, (j) => j);
  for (var i = 1; i <= a.length; i++) {
    final row = [i];
    for (var j = 1; j <= b.length; j++) {
      final swap = prev[j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1);
      row.add(min(swap, min(row[j - 1], prev[j]) + 1));
    }
    prev = row;
  }
  return prev.last;
}
