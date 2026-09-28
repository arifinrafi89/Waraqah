import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';

/// Resolves the book an assistant reply recommends.
///
/// The AI block asks the catalog block for the title through its public
/// repository, which is how recommendations stay inside Waraqah's own listings.
final recommendedBookProvider = FutureProvider.family<Book?, String>(
  (ref, id) => ref.watch(bookRepositoryProvider).findById(id),
);
