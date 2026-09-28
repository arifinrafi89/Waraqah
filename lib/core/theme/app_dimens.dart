/// Spacing, radius and size constants lifted from the design board.
///
/// Using named constants instead of magic numbers keeps every LEGO brick
/// visually consistent and makes a global tweak a one-line change.
abstract final class Insets {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  /// Horizontal gutter every screen body uses.
  static const double screen = 18;
  static const double xl = 22;
}

abstract final class Radii {
  static const double sm = 8;
  static const double md = 12;
  static const double card = 16;
  static const double nav = 24;
  static const double hero = 20;
  static const double pill = 999;
}

abstract final class Sizes {
  static const double iconButton = 38;
  static const double fieldHeight = 46;
  static const double buttonHeight = 48;
  static const double avatar = 28;
  static const double biteCardWidth = 196;
  static const double p2pCardWidth = 150;
  static const double listThumbWidth = 58;
  static const double listThumbHeight = 80;
  /// Space reserved at the bottom of scroll views for the floating nav bar.
  static const double navClearance = 104;
}
