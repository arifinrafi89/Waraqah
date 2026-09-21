import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/home_controller.dart';

class AyahCard extends ConsumerWidget {
  const AyahCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ayah = ref.watch(ayahProvider);

    return GlassContainer(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      opacity: 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daily Ayah",
                style: GoogleFonts.philosopher(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Icon(
                Icons.menu_book_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            ayah.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.amiri(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            ayah.translation,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            ayah.reference,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
