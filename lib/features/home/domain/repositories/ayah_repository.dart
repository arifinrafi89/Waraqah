import '../entities/ayah.dart';

/// Islamic curation block: the verse shown at the top of Home each day.
abstract interface class AyahRepository {
  Future<Ayah> fetchAyahOfTheDay();
}
