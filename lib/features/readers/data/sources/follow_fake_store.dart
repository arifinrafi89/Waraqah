// Followers are marketplace readers, and the followed one is told.
import '../../../notifications/data/sources/notification_community_sends.dart';
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';

/// Who follows whom, as (follower, followed). "me" follows three seed
/// readers, and two follow "me".
class FollowFakeStore {
  FollowFakeStore({
    this.notifications,
    bool Function(String readerId)? isBlocked,
  }) : isBlocked = isBlocked ?? ((_) => false);

  static const _me = P2pPeople.me;
  final NotificationFakeStore? notifications;

  /// Readers "me" blocked can't be followed.
  final bool Function(String readerId) isBlocked;

  final Set<(String, String)> _edges = {
    (_me, 'p-tanvir'),
    (_me, 'p-nabila'),
    (_me, 'p-talha'),
    ('p-arif', _me),
    ('p-mahi', _me),
  };

  bool follows(String follower, String followed) =>
      _edges.contains((follower, followed));

  int followers(String id) => _edges.where((e) => e.$2 == id).length;

  int following(String id) => _edges.where((e) => e.$1 == id).length;

  /// "me" follows or unfollows [id]; `false` for "me", someone unknown or
  /// someone "me" blocked.
  bool follow(String id, {required bool follow}) {
    if (id == _me || P2pPeople.find(id) == null || isBlocked(id)) {
      return false;
    }
    if (!follow) {
      _edges.remove((_me, id));
    } else if (_edges.add((_me, id))) {
      notifications?.followed(id, _me, P2pPeople.find(_me)!.name);
    }
    return true;
  }
}
