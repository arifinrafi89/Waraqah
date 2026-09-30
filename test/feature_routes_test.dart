import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/ai_assistant/ai_assistant_routes.dart';
import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/bites/bites_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/profile/profile_routes.dart';

void main() {
  test(
    'every feature path resolves to a route in the assembled router',
    () async {
      final config = AppRouter.create(startSignedIn: true).configuration;
      final paths = {
        AuthRoutes.login: '/login',
        AiAssistantRoutes.aiChat: '/ai-chat',
        HomeRoutes.home: '/home',
        CatalogRoutes.catalog: '/catalog',
        CatalogRoutes.bookDetail: '/catalog/book/:id',
        CatalogRoutes.bookDetailFor('bk-atomic'): '/catalog/book/bk-atomic',
        P2pRoutes.p2p: '/p2p',
        P2pRoutes.addListing: '/p2p/add-listing',
        BitesRoutes.bites: '/bites',
        ProfileRoutes.profile: '/profile',
        AdminRoutes.admin: '/admin',
        AdminRoutes.section(AdminSection.dashboard): '/admin/dashboard',
        AdminRoutes.section(AdminSection.catalog): '/admin/catalog',
        AdminRoutes.section(AdminSection.orders): '/admin/orders',
        AdminRoutes.section(AdminSection.moderation): '/admin/moderation',
      };
      for (final MapEntry(key: path, value: expected) in paths.entries) {
        expect(path, expected);
        // The pattern constant is matched with a sample id substituted.
        final location = path.replaceFirst(':id', 'sample');
        expect(
          config.findMatch(Uri.parse(location)).isError,
          isFalse,
          reason: path,
        );
      }
    },
  );
}
