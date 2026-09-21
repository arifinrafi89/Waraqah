import 'package:flutter_riverpod/flutter_riverpod.dart';

class Ayah {
  final String text;
  final String translation;
  final String reference;

  Ayah({required this.text, required this.translation, required this.reference});
}

final ayahProvider = Provider<Ayah>((ref) {
  return Ayah(
    text: "وَمَن يَتَّقِ ٱللَّهَ يَجْعَل لَّهُۥ مَخْرَجًۭا",
    translation: "And whoever fears Allah - He will make for him a way out.",
    reference: "Surah At-Talaq 65:2",
  );
});

final homeSearchProvider = StateProvider<String>((ref) => "");
