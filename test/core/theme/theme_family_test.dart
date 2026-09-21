import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/theme/app_palette.dart';
import 'package:waraqah/core/theme/theme_family.dart';

void main() {
  group('ThemeFamily.familiesFor', () {
    test('dark mode offers Forest, Tokyo Night, Mocha', () {
      expect(
        ThemeFamily.familiesFor(ThemeMode.dark),
        [ThemeFamily.forest, ThemeFamily.tokyoNight, ThemeFamily.catppuccinMocha],
      );
    });

    test('light mode offers Nord, Tokyo Day, Latte', () {
      expect(
        ThemeFamily.familiesFor(ThemeMode.light),
        [ThemeFamily.nord, ThemeFamily.tokyoDay, ThemeFamily.catppuccinLatte],
      );
    });
  });

  group('AppPalette.forFamily', () {
    test('resolves the correct 6-way token set per family', () {
      expect(AppPalette.forFamily(ThemeFamily.forest).bg, const Color(0xFF12160F));
      expect(AppPalette.forFamily(ThemeFamily.nord).accent, const Color(0xFF5E81AC));
      expect(AppPalette.forFamily(ThemeFamily.tokyoNight).text, const Color(0xFFC0CAF5));
      expect(AppPalette.forFamily(ThemeFamily.tokyoDay).surface, const Color(0xFFF4F4F8));
      expect(
        AppPalette.forFamily(ThemeFamily.catppuccinMocha).chip1,
        const Color(0xFFCBA6F7),
      );
      expect(
        AppPalette.forFamily(ThemeFamily.catppuccinLatte).chip4,
        const Color(0xFF40A02B),
      );
    });
  });
}
