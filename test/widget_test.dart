import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/app/router/app_routes.dart';
import 'package:waraqah/core/theme/app_palette.dart';
import 'package:waraqah/core/utils/formatters.dart';
import 'package:waraqah/features/ai_assistant/data/sources/waraqah_chatbot.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';
import 'package:waraqah/features/p2p/presentation/providers/p2p_providers.dart';

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

  group('P2P marketplace filters', () {
    test('filter chips match the available book conditions', () {
      expect(P2pFilter.values, [
        P2pFilter.all,
        P2pFilter.likeNew,
        P2pFilter.good,
        P2pFilter.fair,
      ]);
    });

    test('listings are filtered by condition and search', () {
      final listing = P2pListing(
        id: '1',
        title: 'Clean Code',
        sellerName: 'Farhan',
        sellerBatch: "CSE '22",
        priceBdt: 320,
        condition: BookCondition.likeNew,
        coverSeed: 0,
        isAvailable: true,
      );

      expect(listing.matchesFilter(P2pFilter.all, ''), isTrue);
      expect(listing.matchesFilter(P2pFilter.likeNew, ''), isTrue);
      expect(listing.matchesFilter(P2pFilter.good, ''), isFalse);
      expect(listing.matchesFilter(P2pFilter.all, 'clean'), isTrue);
      expect(listing.matchesFilter(P2pFilter.all, 'algorithms'), isFalse);
    });
  });

  group('Waraqah chatbot', () {
    test(
      'answers the exam-prep prompt instead of using the generic fallback',
      () async {
        final reply = await WaraqahChatbot().replyTo('Help me prep for exams');

        expect(reply.text, contains('focused study plan'));
        expect(reply.text, isNot(contains('tell me a subject, author')));
      },
    );
  });

  group('P2P add listing route', () {
    test('registers the add listing route for the floating sell action', () {
      final router = AppRouter.create(startSignedIn: true);

      expect(AppRoutes.p2pAddListing, '/p2p/add-listing');
      expect(
        router.namedLocation(RouteNames.p2pAddListing),
        '/p2p/add-listing',
      );
    });
  });
}
