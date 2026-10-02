import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import '../providers/bite_providers.dart';
import '../providers/bite_tag_providers.dart';
import '../widgets/bite_compose_form.dart';
import '../widgets/bite_compose_skeleton.dart';

/// `/bites/compose`: write a Bite. `?id=` edits one of the Reader's own;
/// `?bookId=` starts with that Book tagged. Signed-in only.
class BiteComposePage extends ConsumerWidget {
  const BiteComposePage({super.key, this.id, this.bookId});

  final String? id;
  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    Widget load<T>(AsyncValue<T> value, Widget Function(T) builder) =>
        AsyncView(
          value: value,
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          skeleton: const BiteComposeSkeleton(),
          builder: builder,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(id == null ? l10n.bitesComposeTitle : l10n.bitesEditTitle),
      ),
      body: switch ((id, bookId)) {
        (final id?, _) => load(
          ref.watch(biteDetailProvider(id)),
          (d) => BiteComposeForm(
            id: id,
            text: d.bite.text,
            spoiler: d.bite.spoiler,
            tag: d.bite.hasBookTag
                ? (id: d.bite.bookId!, title: d.bite.bookTitle!)
                : null,
          ),
        ),
        (_, final bookId?) => load(
          ref.watch(tagBookProvider(bookId)),
          (book) => BiteComposeForm(
            tag: book == null ? null : (id: book.id, title: book.title),
          ),
        ),
        _ => const BiteComposeForm(),
      },
    );
  }
}
