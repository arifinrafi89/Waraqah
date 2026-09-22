import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/p2p/data/p2p_providers.dart';
import 'package:waraqah/features/p2p/data/repositories/dummy_p2p_listing_repository.dart';
import 'package:waraqah/features/p2p/domain/models/p2p_listing.dart';
import 'package:waraqah/features/p2p/domain/repositories/p2p_listing_repository.dart';

class _RecordingP2pListingRepository implements P2pListingRepository {
  final List<P2pListing> added = [];
  final DummyP2pListingRepository _inner = DummyP2pListingRepository();

  @override
  List<P2pListing> getListings() => _inner.getListings();

  @override
  List<P2pListing> addListing(P2pListing listing) {
    added.add(listing);
    return _inner.addListing(listing);
  }
}

void main() {
  testWidgets('Creating a P2P listing writes through to P2pListingRepository', (
    tester,
  ) async {
    final repository = _RecordingP2pListingRepository();

    AppRouter.router.go('/p2p');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          p2pListingRepositoryProvider.overrideWithValue(repository),
        ],
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    AppRouter.router.push('/p2p/create');
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clean Code').last);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Price'),
      '999',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'List it'));
    await tester.pumpAndSettle();

    expect(find.text('৳999'), findsWidgets);
    expect(repository.added, hasLength(1));
    expect(repository.added.single.price, 999);
  });
}
