import 'season.dart';

/// What a Banner opens.
enum BannerTargetKind { collection, section, book, search }

/// A Banner's one link: a Collection id, Section name, Book id or search
/// query, by [kind]. Holds no paths; the widget maps it to a route.
class BannerTarget {
  const BannerTarget(this.kind, this.value);

  final BannerTargetKind kind;
  final String value;
}

/// A promo tile at the top of Home, made by Staff. Text only; its colours
/// come from [seed].
class Banner {
  const Banner({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleEn,
    required this.subtitleBn,
    required this.seed,
    required this.target,
    this.season,
  });

  final String id;
  final String titleEn;
  final String titleBn;
  final String subtitleEn;
  final String subtitleBn;
  final int seed;
  final BannerTarget target;

  /// Shown first, and only, while this Season is on; `null` = all year.
  final Season? season;

  String title(bool isBangla) => isBangla ? titleBn : titleEn;

  String subtitle(bool isBangla) => isBangla ? subtitleBn : subtitleEn;
}
