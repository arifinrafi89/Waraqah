import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/bite_repository_impl.dart';
import '../../data/sources/bite_remote_source.dart';
import '../../domain/entities/bite.dart';
import '../../domain/entities/bite_query.dart';
import '../../domain/repositories/bite_repository.dart';
import '../../domain/usecases/delete_bite.dart';
import '../../domain/usecases/delete_comment.dart';
import '../../domain/usecases/get_bite_detail.dart';
import '../../domain/usecases/get_bites.dart';
import '../../domain/usecases/like_bite.dart';
import '../../domain/usecases/post_comment.dart';
import '../../domain/usecases/save_bite.dart';

final biteRepositoryProvider = Provider<BiteRepository>(
  (ref) => BiteRepositoryImpl(BiteRemoteSource(ref.watch(dioProvider))),
);

final getBitesProvider = Provider(
  (ref) => GetBites(ref.watch(biteRepositoryProvider)),
);
final getBiteDetailProvider = Provider(
  (ref) => GetBiteDetail(ref.watch(biteRepositoryProvider)),
);
final saveBiteProvider = Provider(
  (ref) => SaveBite(ref.watch(biteRepositoryProvider)),
);
final deleteBiteProvider = Provider(
  (ref) => DeleteBite(ref.watch(biteRepositoryProvider)),
);
final likeBiteProvider = Provider(
  (ref) => LikeBite(ref.watch(biteRepositoryProvider)),
);
final postCommentProvider = Provider(
  (ref) => PostComment(ref.watch(biteRepositoryProvider)),
);
final deleteCommentProvider = Provider(
  (ref) => DeleteComment(ref.watch(biteRepositoryProvider)),
);

/// A feed, newest first. Reloads when someone signs in or out, since the
/// server marks "me"'s Bites and likes.
final bitesProvider = FutureProvider.family<List<Bite>, BiteQuery>((
  ref,
  query,
) {
  ref.watch(sessionProvider.select((u) => u?.id));
  return ref.watch(getBitesProvider).call(query);
});

/// The first four of For You, for Home's strip.
final biteFeedProvider = FutureProvider<List<Bite>>(
  (ref) async =>
      (await ref.watch(bitesProvider(const BiteQuery()).future))
          .take(4)
          .toList(),
);

/// One Bite with its comments.
final biteDetailProvider = FutureProvider.family<BiteDetail, String>((ref, id) {
  ref.watch(sessionProvider.select((u) => u?.id));
  return ref.watch(getBiteDetailProvider).call(id);
});
