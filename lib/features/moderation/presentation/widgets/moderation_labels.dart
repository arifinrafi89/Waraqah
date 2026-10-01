import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_labels.dart';
import '../../domain/entities/audit_entry.dart';
import '../../domain/entities/queued_listing.dart';

/// Moderator-facing words for the Moderation Center.
extension ModerationLabels on AppL10n {
  String decisionTitle(ListingDecision decision) => switch (decision) {
    ListingDecision.requestChanges => moderationReasonChangesTitle,
    _ => moderationReasonRejectTitle,
  };

  /// One-tap reasons that fill the reason field.
  List<String> quickReasons(ListingDecision decision) => switch (decision) {
    ListingDecision.requestChanges => [
      moderationQuickPhotos,
      moderationQuickCondition,
      moderationQuickPrice,
    ],
    _ => [moderationQuickPhotocopy, moderationQuickCondition],
  };

  String photoLabel(String slot) => switch (slot) {
    'front' => moderationPhotoFront,
    'back' => moderationPhotoBack,
    'spine' => moderationPhotoSpine,
    'inside' => moderationPhotoInside,
    'damage' => moderationPhotoDamage,
    _ => slot,
  };

  String flagLabel(String flag) => switch (flag) {
    'highlighting' => listingFlagHighlighting,
    'notes' => listingFlagNotes,
    'damage' => listingFlagDamage,
    _ => flag,
  };

  String kindLabel(ReportTargetKind kind) => switch (kind) {
    ReportTargetKind.listing => moderationKindListing,
    ReportTargetKind.user => moderationKindUser,
    ReportTargetKind.message => moderationKindMessage,
    ReportTargetKind.bite => moderationKindBite,
    ReportTargetKind.comment => moderationKindComment,
    ReportTargetKind.review => moderationKindReview,
  };

  String auditLabel(AuditAction action) => switch (action) {
    AuditAction.approved => moderationLogApproved,
    AuditAction.changesRequested => moderationLogChangesRequested,
    AuditAction.rejected => moderationLogRejected,
    AuditAction.removed => moderationLogRemoved,
    AuditAction.dismissed => moderationLogDismissed,
    AuditAction.warned => moderationLogWarned,
    AuditAction.banned => moderationLogBanned,
  };

  /// A report reason in words; a moderator's own words stay as they are.
  String auditReason(String reason) {
    if (reason == 'strikes') return moderationLogThirdStrike;
    final known = ReportReason.values.where((r) => r.name == reason);
    return known.isEmpty ? reason : reportReason(known.first);
  }
}

/// "Oct 1, 3:40 PM", in the current language.
String moderationTime(BuildContext context, DateTime at) =>
    DateFormat.MMMd(Localizations.localeOf(context).toLanguageTag())
        .add_jm()
        .format(at);
