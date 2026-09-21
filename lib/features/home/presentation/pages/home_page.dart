import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../widgets/ayah_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFECFDF5), // Light emerald shade
              Colors.white,
              Colors.amber.shade50.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              _buildAppBar(context),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 20),
                    const AyahCard()
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 24),
                    _buildSearchBar(context),
                    const SizedBox(height: 32),
                    _buildSectionHeader(context, "Explore Waraqah"),
                    const SizedBox(height: 16),
                    _buildFeatureGrid(context),
                    const SizedBox(height: 32),
                    _buildSectionHeader(context, "Recent in Book-Bites"),
                    const SizedBox(height: 100), // Spacing for bottom nav if any
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Row(
          children: [
            Text(
              "Waraqah",
              style: GoogleFonts.philosopher(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      opacity: 0.05,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for books, authors...",
          hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See All",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    final features = [
      {'name': 'Catalog', 'icon': Icons.library_books, 'color': Colors.blue},
      {'name': 'Resell', 'icon': Icons.swap_horizontal_circle, 'color': Colors.orange},
      {'name': 'AI Chat', 'icon': Icons.psychology, 'color': Colors.purple},
      {'name': 'Profile', 'icon': Icons.person, 'color': Colors.teal},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
          child: GlassContainer(
            padding: const EdgeInsets.all(16),
            opacity: 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(feature['icon'] as IconData, color: feature['color'] as Color, size: 30),
                Text(
                  feature['name'] as String,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
