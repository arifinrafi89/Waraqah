import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/booklist_providers.dart';
import 'book_list_skeleton.dart';

/// Finds Books by title, Author or ISBN. Tapping one adds it (`true`) or,
/// when its tick shows it's already in, takes it out (`false`). Admin's
/// list builder and a Reader's own lists use it.
Future<void> showBookPickerSheet(
  BuildContext context, {
  required Iterable<String> picked,
  required void Function(String bookId, bool add) onPick,
}) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) => FractionallySizedBox(
    heightFactor: 0.85,
    child: _BookPicker(picked: picked.toSet(), onPick: onPick),
  ),
);

class _BookPicker extends ConsumerStatefulWidget {
  const _BookPicker({required this.picked, required this.onPick});

  final Set<String> picked;
  final void Function(String bookId, bool add) onPick;

  @override
  ConsumerState<_BookPicker> createState() => _BookPickerState();
}

class _BookPickerState extends ConsumerState<_BookPicker> {
  var _query = '';
  late final _picked = {...widget.picked};

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.booklistPickerTitle,
                  style: context.texts.titleMedium,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.booklistPickerDone),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Insets.screen),
          child: AppTextField(
            hint: l10n.catalogSearchHint,
            icon: Icons.search_rounded,
            onChanged: (q) => setState(() => _query = q.trim()),
          ),
        ),
        Expanded(
          child: AsyncView(
            value: ref.watch(bookPickerResultsProvider(_query)),
            skeleton: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.screen),
              child: BookListSkeleton(),
            ),
            errorLabel: l10n.commonSomethingWentWrong,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(bookPickerResultsProvider(_query)),
            builder: (books) => books.isEmpty
                ? Center(child: Text(l10n.booklistPickerEmpty))
                : ListView(
                    children: [
                      for (final b in books)
                        ListTile(
                          title: Text(b.title),
                          subtitle: Text(b.author),
                          trailing: _picked.contains(b.id)
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  color: palette.accent,
                                )
                              : Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: palette.textFaint,
                                ),
                          onTap: () {
                            final add = !_picked.contains(b.id);
                            setState(
                              () => add
                                  ? _picked.add(b.id)
                                  : _picked.remove(b.id),
                            );
                            widget.onPick(b.id, add);
                          },
                        ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
