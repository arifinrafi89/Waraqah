import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_list_skeleton.dart';

/// Finds a Book by title or Author. Closes with its id.
Future<String?> showBookPicker(BuildContext context) =>
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) =>
          const FractionallySizedBox(heightFactor: 0.8, child: _BookPicker()),
    );

class _BookPicker extends ConsumerStatefulWidget {
  const _BookPicker();

  @override
  ConsumerState<_BookPicker> createState() => _BookPickerState();
}

class _BookPickerState extends ConsumerState<_BookPicker> {
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: AppTextField(
            hint: l10n.adminCatalogSearchBooks,
            icon: Icons.search_rounded,
            autofocus: true,
            onChanged: (q) => setState(() => _query = q.trim().toLowerCase()),
          ),
        ),
        Expanded(
          child: AsyncView(
            value: ref.watch(adminBooksProvider),
            skeleton: const AdminListSkeleton(),
            errorLabel: l10n.commonSomethingWentWrong,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(adminBooksProvider),
            builder: (books) => ListView(
              children: [
                for (final b in books)
                  if ('${b.title} ${b.author}'.toLowerCase().contains(_query))
                    ListTile(
                      title: Text(b.title),
                      subtitle: Text(b.author),
                      onTap: () => Navigator.pop(context, b.id),
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
