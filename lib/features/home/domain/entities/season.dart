/// A time of year Home changes for. One at a time: Ramadan beats Boi Mela,
/// which beats admission season, which beats back to school.
enum Season { ramadan, boiMela, admission, backToSchool }

/// The active Season's hero card on Home: text, colours from [seed], and the
/// Collection it opens.
class SeasonInfo {
  const SeasonInfo({
    required this.season,
    required this.titleEn,
    required this.titleBn,
    required this.subtitleEn,
    required this.subtitleBn,
    required this.seed,
    required this.collectionId,
  });

  final Season season;
  final String titleEn;
  final String titleBn;
  final String subtitleEn;
  final String subtitleBn;
  final int seed;
  final String collectionId;

  String title(bool isBangla) => isBangla ? titleBn : titleEn;

  String subtitle(bool isBangla) => isBangla ? subtitleBn : subtitleEn;
}
