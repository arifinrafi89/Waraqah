// Moderators change marketplace Listings and the reports readers sent.
import '../../../inbox/data/sources/inbox_fake_store.dart';
// Sellers hear about decisions, warnings and bans.
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../notifications/data/sources/notification_sends.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../report/data/sources/report_fake_store.dart';
import '../../domain/entities/audit_entry.dart';
import '../../domain/entities/moderation_rules.dart';
import '../../domain/entities/queued_listing.dart';
import '../models/audit_entry_model.dart';
import '../models/queued_listing_model.dart';
import 'moderation_seed.dart';
import 'moderation_subjects.dart';

/// The Moderation Center on the fake backend: the Listing queue, strikes
/// and bans (one system for every kind of content) and the audit log.
class ModerationFakeStore {
  ModerationFakeStore(
    this.p2p,
    this.reports, {
    InboxFakeStore? inbox,
    this.notifications,
    DateTime Function()? clock,
  }) : now = clock ?? DateTime.now,
       subjects = ModerationSubjects(p2p, inbox) {
    seedReports(this);
  }

  final P2pFakeStore p2p;
  final ReportFakeStore reports;
  final ModerationSubjects subjects;
  final NotificationFakeStore? notifications;
  final DateTime Function() now;
  final Map<String, int> strikes = {};
  final Set<String> banned = {};

  /// Newest last.
  final List<AuditEntryModel> log = [];

  bool isBanned(String readerId) => banned.contains(readerId);

  List<Map<String, dynamic>> queueJson() => [
    for (final l in p2p.all)
      if (l.status == P2pListingStatus.inReview)
        QueuedListingModel(
          id: l.id,
          title: l.title,
          sellerId: l.sellerId,
          sellerName: l.sellerName,
          priceBdt: l.priceBdt,
          condition: l.condition,
          flags: l.flags,
          photos: l.photos,
          coverSeed: l.coverSeed,
          sellerStrikes: strikes[l.sellerId] ?? 0,
          newPriceBdt: l.newPriceBdt,
          note: l.note,
        ).toJson(),
  ];

  /// `false` when the Listing isn't waiting or the reason is missing.
  bool decide(String id, ListingDecision decision, String by, String? reason) {
    final listing = p2p.find(id);
    if (listing == null ||
        listing.status != P2pListingStatus.inReview ||
        ModerationRules.checkDecision(decision, reason) != null) {
      return false;
    }
    final (status, action) = switch (decision) {
      ListingDecision.approve => (P2pListingStatus.live, AuditAction.approved),
      ListingDecision.requestChanges => (
        P2pListingStatus.changesRequested,
        AuditAction.changesRequested,
      ),
      ListingDecision.reject => (
        P2pListingStatus.rejected,
        AuditAction.rejected,
      ),
    };
    p2p.moderate(id, status, reason: reason);
    notifications?.listingDecided(listing, decision.name, reason);
    record(by, action, listing.title, reason);
    return true;
  }

  /// A warning adds a strike; the last one bans. Answers the new count.
  int warn(String ownerId) {
    final next = ModerationRules.afterWarning(strikes[ownerId] ?? 0);
    strikes[ownerId] = next.strikes;
    if (next.banned) banned.add(ownerId);
    notifications?.warned(ownerId, next.strikes, ModerationRules.maxStrikes);
    return next.strikes;
  }

  void ban(String ownerId) {
    strikes[ownerId] = ModerationRules.maxStrikes;
    banned.add(ownerId);
    notifications?.banned(ownerId);
  }

  void record(String by, AuditAction action, String subject, [String? why]) =>
      log.add(
        AuditEntryModel(
          id: 'au-${log.length + 1}',
          at: now(),
          by: by,
          action: action,
          subject: subject,
          reason: why,
        ),
      );
}
