import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../../orders/presentation/providers/order_providers.dart';

/// A book the reader bought from Waraqah and could have finished.
typedef BoughtBook = ({String bookId, String title});

/// Books from the reader's delivered orders, once each, newest first.
///
/// Stand-in for Niloy's shelves: until "Finished" exists there, these are
/// the books the reader can say they finished.
final boughtBooksProvider = Provider<List<BoughtBook>>((ref) {
  if (ref.watch(sessionProvider) == null) return const [];
  final orders = ref.watch(myOrdersProvider).value ?? const [];
  final seen = <String>{};
  return [
    for (final order in orders)
      if (order.status == OrderStatus.delivered)
        for (final line in order.lines)
          if (seen.add(line.bookId)) (bookId: line.bookId, title: line.title),
  ];
});
