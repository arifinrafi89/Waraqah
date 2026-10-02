import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/review_repository_impl.dart';
import '../../data/sources/review_remote_source.dart';
import '../../domain/entities/review.dart';
import '../../domain/repositories/review_repository.dart';
import '../../domain/usecases/delete_review.dart';
import '../../domain/usecases/get_reviews.dart';
import '../../domain/usecases/save_review.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>(
  (ref) => ReviewRepositoryImpl(ReviewRemoteSource(ref.watch(dioProvider))),
);

final saveReviewProvider = Provider(
  (ref) => SaveReview(ref.watch(reviewRepositoryProvider)),
);

final deleteReviewProvider = Provider(
  (ref) => DeleteReview(ref.watch(reviewRepositoryProvider)),
);

/// A Book's reviews. Reloads when someone signs in or out ("mine" changes).
final bookReviewsProvider = FutureProvider.family<BookReviews, String>((
  ref,
  bookId,
) {
  ref.watch(sessionProvider.select((u) => u?.id));
  return GetReviews(ref.watch(reviewRepositoryProvider))(bookId);
});
