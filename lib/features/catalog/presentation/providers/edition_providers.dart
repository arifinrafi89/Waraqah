import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../domain/entities/delivery_area.dart';

/// The Edition the reader picked on a book page, by edition id. `null` until
/// they pick one, which means "the From-price edition".
class SelectedEditionNotifier extends Notifier<String?> {
  SelectedEditionNotifier(this.bookId);

  final String bookId;

  @override
  String? build() => null;

  void select(String editionId) => state = editionId;
}

final selectedEditionIdProvider =
    NotifierProvider.family<SelectedEditionNotifier, String?, String>(
      SelectedEditionNotifier.new,
    );

/// Where to estimate delivery for. A manual choice for now; it will follow
/// the reader's default saved address once addresses exist.
final deliveryAreaProvider = selectionProvider<DeliveryArea>(
  DeliveryArea.insideDhaka,
);

extension ChosenEdition on Book {
  /// The Edition with [editionId], or the From-price edition when nothing
  /// (or an unknown id) is chosen.
  Edition chosenEdition(String? editionId) =>
      editions.where((e) => e.id == editionId).firstOrNull ?? fromEdition;
}
