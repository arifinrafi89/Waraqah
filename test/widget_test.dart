import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/theme/app_palette.dart';
import 'package:waraqah/core/utils/formatters.dart';

void main() {
  group('Bdt.format', () {
    test('adds the taka symbol', () {
      expect(Bdt.format(650), '৳650');
    });

    test('groups thousands', () {
      expect(Bdt.format(12500), '৳12,500');
      expect(Bdt.format(1204), '৳1,204');
    });
  });

  group('AppPalette', () {
    test('light and dark expose the same number of chip colours', () {
      expect(AppPalette.light.chips.length, AppPalette.dark.chips.length);
    });

    test('chipFor wraps around and is stable for a seed', () {
      final palette = AppPalette.dark;
      expect(palette.chipFor(0), palette.chips[0]);
      expect(palette.chipFor(4), palette.chips[0]);
      expect(palette.chipFor(7), palette.chipFor(7));
    });

    test('is registered as a theme extension on both themes', () {
      for (final palette in [AppPalette.light, AppPalette.dark]) {
        final theme = ThemeData(extensions: [palette]);
        expect(theme.extension<AppPalette>(), palette);
      }
    });
  });
}
