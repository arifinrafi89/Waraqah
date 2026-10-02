import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../scan/domain/entities/isbn.dart';
import '../../catalog_admin_routes.dart';
import '../../domain/entities/isbn_lookup.dart';
import '../../domain/usecases/look_up_isbn.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_text_field.dart';
import 'isbn_fill.dart';

enum _Result { none, invalid, notFound }

/// The Add book form's ISBN lookup. A Book from outside fills the form; an
/// unknown Author or Publisher opens "Add new" with its name filled in.
class IsbnLookupField extends ConsumerStatefulWidget {
  const IsbnLookupField({super.key});

  @override
  ConsumerState<IsbnLookupField> createState() => _IsbnLookupFieldState();
}

class _IsbnLookupFieldState extends ConsumerState<IsbnLookupField> {
  var _text = '';
  var _result = _Result.none;
  String? _inCatalog;

  Future<void> _lookUp() async {
    final isbn = Isbn.normalize(_text);
    setState(() {
      _result = isbn == null ? _Result.invalid : _Result.none;
      _inCatalog = null;
    });
    if (isbn == null) return;
    final repository = ref.read(catalogAdminRepositoryProvider);
    final found = await LookUpIsbn(repository)(isbn);
    if (!mounted) return;
    setState(() {
      _result = found == null ? _Result.notFound : _Result.none;
      if (found is IsbnInCatalog) _inCatalog = found.bookId;
    });
    if (found is IsbnFound) await fillFromIsbn(context, ref, found);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final note = context.texts.bodySmall?.copyWith(
      color: context.palette.textDim,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        Row(
          spacing: Insets.sm,
          children: [
            Expanded(
              child: AdminTextField(
                label: l10n.adminCatalogIsbnLookupField,
                error: _result == _Result.invalid
                    ? l10n.adminCatalogErrIsbnInvalid
                    : null,
                onChanged: (v) => _text = v,
              ),
            ),
            FilledButton.tonal(
              onPressed: _lookUp,
              child: Text(l10n.adminCatalogLookUp),
            ),
          ],
        ),
        if (_result == _Result.notFound)
          Text(l10n.adminCatalogIsbnNotFound, style: note),
        if (_inCatalog case final id?)
          Row(
            children: [
              Expanded(
                child: Text(l10n.adminCatalogIsbnInCatalog, style: note),
              ),
              TextButton(
                onPressed: () =>
                    context.pushReplacement(CatalogAdminRoutes.bookFor(id)),
                child: Text(l10n.adminCatalogOpen),
              ),
            ],
          ),
      ],
    );
  }
}
