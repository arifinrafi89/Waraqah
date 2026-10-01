/// One rough sound key per name, so Bangla script, Banglish and English
/// spellings meet: "sapiens", "sapiyens" and "স্যাপিয়েন্স" all give `spns`.
///
/// Bangla script maps letter by letter to Latin, then every spelling folds the
/// same way. A word keeps its leading vowel as `a` and drops the others:
/// Bangla writes no inherent vowel, so "অ্যাটমিক" (atmik) only meets "atomic"
/// once vowels are gone. Fake-backend side: the Go backend will own matching.
// ponytail: naive transliteration; swap for a real phonetic index server-side.
abstract final class PhoneticKey {
  /// [text]'s key: one folded chunk per word, joined by single spaces.
  static String of(String text) =>
      _toLatin(_clean(text.toLowerCase()))
          .split(' ')
          .map(_fold)
          .where((word) => word.isNotEmpty)
          .join(' ');

  /// Precomposes nukta letters, drops ya-phala and joiners, and turns
  /// punctuation into word breaks (apostrophes vanish: "o'reilly" = "oreilly").
  static String _clean(String text) => text
      .replaceAll('\u09AF\u09BC', '\u09DF')
      .replaceAll('\u09A1\u09BC', '\u09DC')
      .replaceAll('\u09A2\u09BC', '\u09DD')
      .replaceAll('\u09CD\u09AF', '')
      .replaceAll(RegExp('[\u200C\u200D\'’]'), '')
      .replaceAll(RegExp('[^a-z0-9\u0980-\u09FF]+'), ' ');

  static String _toLatin(String text) {
    final out = StringBuffer();
    for (final rune in text.runes) {
      final char = String.fromCharCode(rune);
      if (rune >= 0x09E6 && rune <= 0x09EF) {
        out.write(rune - 0x09E6);
      } else {
        out.write(_bangla[char] ?? char);
      }
    }
    return out.toString();
  }

  static String _fold(String word) {
    var w = word;
    for (final (from, to) in _folds) {
      w = w.replaceAll(from, to);
    }
    if (w.isEmpty) return w;
    final lead = 'aeiou'.contains(w[0]) ? 'a' : '';
    return (lead + w.replaceAll(RegExp('[aeiou]'), '')).replaceAllMapped(
      RegExp(r'(.)\1+'),
      (m) => m[1]!,
    );
  }

  static const List<(String, String)> _folds = [
    ('kh', 'k'), ('gh', 'g'), ('ch', 'c'), ('jh', 'j'), ('th', 't'),
    ('dh', 'd'), ('ph', 'f'), ('bh', 'b'), ('sh', 's'),
    // "alchemist" = "alkemist": every c ends up a k.
    ('c', 'k'), ('z', 'j'), ('v', 'b'), ('q', 'k'), ('w', ''), ('y', ''),
  ];

  /// Bangla letter → Latin, space-separated `letter=latin` pairs (empty =
  /// dropped). Nukta letters are escaped so they stay one rune each.
  static final Map<String, String> _bangla = {
    for (final pair
        in 'ক=k খ=kh গ=g ঘ=gh ঙ=ng চ=ch ছ=ch জ=j ঝ=jh ঞ=n ট=t ঠ=th ড=d ঢ=dh '
                'ণ=n ত=t থ=th দ=d ধ=dh ন=n প=p ফ=f ব=b ভ=bh ম=m য=j র=r ল=l '
                'শ=sh ষ=sh স=s হ=h \u09DC=r \u09DD=r \u09DF=y ৎ=t ং=ng ঃ=h ঁ= '
                '\u09CD= \u09BC= অ=a আ=a া=a ই=i ি=i ঈ=i ী=i উ=u ু=u ঊ=u ূ=u '
                'ঋ=ri ৃ=ri এ=e ে=e ঐ=oi ৈ=oi ও=o ো=o ঔ=ou ৌ=ou'
            .split(' '))
      pair.split('=').first: pair.split('=').last,
  };
}
