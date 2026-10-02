import 'package:dio/dio.dart';

// A Reader's page counts their Bites and live Listings, and reads "me"'s
// privacy setting from Profile.
import '../../../bites/data/sources/bite_fake_store.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../profile/data/sources/profile_fake_store.dart';
import '../models/reader_model.dart';
import 'follow_fake_store.dart';

/// Readers' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. A refused change answers `null`.
abstract final class ReaderFakeApi {
  /// `?id=`: one Reader's page.
  static const String detail = '/readers/detail';

  /// Body `{id, follow}`: answers the Reader's page.
  static const String follow = '/readers/follow';

  /// Seed readers who keep their profile private.
  static const Set<String> privateSeed = {'p-rafi'};

  static Map<String, Object? Function(RequestOptions)> routes(
    FollowFakeStore follows, {
    required ProfileFakeStore profile,
    required BiteFakeStore bites,
    required P2pFakeStore p2p,
  }) {
    Map<String, dynamic>? page(String id) {
      final p = P2pPeople.find(id);
      if (p == null) return null;
      final isMe = id == P2pPeople.me;
      final visible = isMe
          ? profile.prefs.profileVisible
          : !privateSeed.contains(id);
      final base = ReaderModel(
        id: id,
        name: p.name,
        isMe: isMe,
        isFollowing: follows.follows(P2pPeople.me, id),
        profileVisible: visible,
      );
      if (!visible && !isMe) return base.toJson();
      return base
          .copyWith(
            area: p.area,
            district: p.district,
            memberSince: p.memberSince,
            followers: follows.followers(id),
            following: follows.following(id),
            biteCount: bites.bites.where((b) => b.authorId == id).length,
            liveListingCount: p2p.all
                .where(
                  (l) => l.sellerId == id && l.status == P2pListingStatus.live,
                )
                .length,
          )
          .toJson();
    }

    return {
      detail: (o) => page(o.queryParameters['id'] as String? ?? ''),
      follow: (o) {
        final body = o.data as Map<String, dynamic>? ?? const {};
        final id = body['id'] as String? ?? '';
        return follows.follow(id, follow: body['follow'] == true)
            ? page(id)
            : null;
      },
    };
  }
}
