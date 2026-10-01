import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_entry.freezed.dart';

/// Every action a moderator can take, as the audit log records it.
enum AuditAction {
  approved,
  changesRequested,
  rejected,
  removed,
  dismissed,
  warned,
  banned,
}

/// One line of the audit log: who did what to which thing, and why.
@freezed
abstract class AuditEntry with _$AuditEntry {
  const factory AuditEntry({
    required String id,
    required DateTime at,
    required String by,
    required AuditAction action,

    /// A Listing's title, a reader's name or the reported words.
    required String subject,
    String? reason,
  }) = _AuditEntry;
}
