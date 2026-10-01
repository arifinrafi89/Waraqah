import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../providers/catalog_admin_providers.dart';
import 'edition_fields.dart';

/// Adds or edits one Edition. Closes with it once it passes
/// [CatalogAdminRules.edition] against the Book's other Editions and every
/// other Book's ISBNs.
Future<Edition?> showEditionSheet(
  BuildContext context, {
  required String? bookId,
  required List<Edition> siblings,
  Edition? edition,
}) => showModalBottomSheet<Edition>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) => _EditionForm(bookId, siblings, edition),
);

class _EditionForm extends ConsumerStatefulWidget {
  const _EditionForm(this.bookId, this.siblings, this.initial);

  final String? bookId;
  final List<Edition> siblings;
  final Edition? initial;

  @override
  ConsumerState<_EditionForm> createState() => _EditionFormState();
}

class _EditionFormState extends ConsumerState<_EditionForm> {
  late var _edition =
      widget.initial ??
      const Edition(
        id: '',
        format: BookFormat.paperback,
        language: BookLanguage.bangla,
        priceBdt: 0,
        stock: 0,
      );
  Set<RuleError> _errors = const {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    void set(Edition e) => setState(() => _edition = e);
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
          EditionFields(edition: _edition, errors: _errors, onChanged: set),
          PrimaryButton(label: l10n.adminCatalogDone, onPressed: _done),
        ],
      ),
    );
  }

  void _done() {
    final books = ref.read(adminBooksProvider).value ?? const [];
    final takenIsbns = {
      for (final b in books)
        if (b.id != widget.bookId) ...b.editions.map((e) => e.isbn).nonNulls,
    };
    final errors = CatalogAdminRules.edition(
      _edition,
      siblings: widget.siblings,
      takenIsbns: takenIsbns,
    );
    if (errors.isEmpty) {
      Navigator.pop(context, CatalogAdminRules.tidy(_edition));
    } else {
      setState(() => _errors = errors);
    }
  }
}
