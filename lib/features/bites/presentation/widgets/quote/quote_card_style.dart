import 'package:flutter/material.dart';

import '../../../../../core/theme/app_palette.dart';
import '../../../../../core/utils/cover_gradient.dart';
import '../../../../../l10n/app_localizations.dart';

/// A quote card's look, built from palette tokens so each reads well in
/// both themes.
enum QuoteCardStyle { paper, ink, leaf, cover }

extension QuoteCardStyleX on QuoteCardStyle {
  String label(AppL10n l10n) => switch (this) {
    QuoteCardStyle.paper => l10n.quoteStylePaper,
    QuoteCardStyle.ink => l10n.quoteStyleInk,
    QuoteCardStyle.leaf => l10n.quoteStyleLeaf,
    QuoteCardStyle.cover => l10n.quoteStyleCover,
  };

  /// The background; [seed] picks the cover colour (the Book's cover seed).
  Gradient background(AppPalette p, int seed) => switch (this) {
    QuoteCardStyle.paper => LinearGradient(colors: [p.surface, p.surface2]),
    QuoteCardStyle.ink => LinearGradient(colors: [p.text, p.textDim]),
    QuoteCardStyle.leaf => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [p.chips[1], p.accent],
    ),
    QuoteCardStyle.cover => CoverGradient.of(p.chipFor(seed)),
  };

  Color ink(AppPalette p) => switch (this) {
    QuoteCardStyle.paper => p.text,
    QuoteCardStyle.ink => p.bg,
    QuoteCardStyle.leaf => p.accentInk,
    // Covers darken towards the bottom, like the book covers.
    QuoteCardStyle.cover => AppPalette.dark.text,
  };
}
