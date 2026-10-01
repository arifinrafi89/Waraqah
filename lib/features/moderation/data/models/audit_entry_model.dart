import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/audit_entry.dart';

part 'audit_entry_model.freezed.dart';
part 'audit_entry_model.g.dart';

/// JSON shape of an [AuditEntry].
@freezed
abstract class AuditEntryModel with _$AuditEntryModel {
  const factory AuditEntryModel({
    required String id,
    required DateTime at,
    required String by,
    required AuditAction action,
    required String subject,
    String? reason,
  }) = _AuditEntryModel;

  factory AuditEntryModel.fromJson(Map<String, dynamic> json) =>
      _$AuditEntryModelFromJson(json);
}

extension AuditEntryModelX on AuditEntryModel {
  AuditEntry toEntity() => AuditEntry(
    id: id,
    at: at,
    by: by,
    action: action,
    subject: subject,
    reason: reason,
  );
}
