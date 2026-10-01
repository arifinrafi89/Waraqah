import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../../domain/entities/catalog_record.dart';
import '../providers/catalog_admin_actions.dart';
import 'admin_text_field.dart';
import 'rule_error_labels.dart';

/// Adds or edits a Category, Author or Publisher. Closes with the saved one.
Future<CatalogRecord?> showRecordSheet(
  BuildContext context,
  RecordKind kind, [
  CatalogRecord record = const CatalogRecord(),
]) => showModalBottomSheet<CatalogRecord>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) => _RecordForm(kind, record),
);

class _RecordForm extends ConsumerStatefulWidget {
  const _RecordForm(this.kind, this.initial);

  final RecordKind kind;
  final CatalogRecord initial;

  @override
  ConsumerState<_RecordForm> createState() => _RecordFormState();
}

class _RecordFormState extends ConsumerState<_RecordForm> {
  late var _record = widget.initial.copyWith(
    section: widget.kind == RecordKind.category
        ? widget.initial.section ?? Section.academic
        : null,
  );
  Set<RuleError> _errors = const {};
  var _failed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final isCategory = widget.kind == RecordKind.category;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(l10n.recordKind(widget.kind), style: context.texts.titleMedium),
          AdminTextField(
            label: l10n.adminCatalogFieldName,
            initialValue: _record.name,
            error: l10n.ruleErrorOf(_errors, {RuleError.nameBlank}),
            onChanged: (v) => _record = _record.copyWith(name: v),
          ),
          AdminTextField(
            label: isCategory
                ? l10n.adminCatalogFieldNameBn
                : l10n.adminCatalogFieldNameBnOptional,
            initialValue: _record.nameBn,
            error: l10n.ruleErrorOf(_errors, {RuleError.nameBnBlank}),
            onChanged: (v) => _record = _record.copyWith(nameBn: v),
          ),
          if (isCategory)
            DropdownButtonFormField<Section>(
              initialValue: _record.section,
              isExpanded: true,
              decoration: adminInputDecoration(
                context,
                l10n.adminCatalogFieldSection,
              ),
              items: [
                for (final s in Section.values)
                  DropdownMenuItem(value: s, child: Text(s.label(l10n))),
              ],
              onChanged: (s) => _record = _record.copyWith(section: s),
            ),
          if (_failed)
            Text(
              l10n.adminCatalogSaveFailed,
              style: AppFonts.ui(size: 12, color: context.palette.danger),
            ),
          PrimaryButton(label: l10n.adminCatalogSave, onPressed: _save),
        ],
      ),
    );
  }

  Future<void> _save() async {
    setState(() => _errors = CatalogAdminRules.record(widget.kind, _record));
    if (_errors.isNotEmpty) return;
    try {
      final saved = await ref
          .read(catalogAdminActionsProvider)
          .saveRecord(widget.kind, _record);
      if (mounted) Navigator.pop(context, saved);
    } catch (_) {
      setState(() => _failed = true);
    }
  }
}
