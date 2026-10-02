import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite_query.dart';
import '../../domain/entities/bite_rules.dart';
import 'bite_actions.dart';
import 'bite_counter.dart';
import 'book_tag_field.dart';

/// The composer's fields: text with a live counter, a Book tag and the
/// spoiler switch (only with a tag). Posts, or saves an edit to [id].
class BiteComposeForm extends ConsumerStatefulWidget {
  const BiteComposeForm({
    super.key,
    this.id,
    this.text = '',
    this.tag,
    this.spoiler = false,
  });

  final String? id;
  final String text;
  final BiteTag? tag;
  final bool spoiler;

  @override
  ConsumerState<BiteComposeForm> createState() => _BiteComposeFormState();
}

class _BiteComposeFormState extends ConsumerState<BiteComposeForm> {
  late final _text = TextEditingController(text: widget.text);
  late BiteTag? _tag = widget.tag;
  late bool _spoiler = widget.spoiler;
  bool _saving = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  BiteDraft get _draft => BiteDraft(
    id: widget.id,
    text: _text.text.trim(),
    bookId: _tag?.id,
    spoiler: _spoiler && _tag != null,
  );

  Future<void> _save() async {
    setState(() => _saving = true);
    final ok = await ref.saveBite(context, _draft);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!ok) return;
    final router = GoRouter.of(context);
    router.canPop() ? router.pop() : router.go(BitesRoutes.bites);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final d = _draft;
    final ok = BiteRules.check(d.text, bookId: d.bookId) == null;
    return ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        TextField(
          controller: _text,
          autofocus: widget.id == null,
          minLines: 5,
          maxLines: 10,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(hintText: l10n.bitesComposerHint),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: BiteCounter(text: _text.text, max: BiteRules.maxLength),
        ),
        const SizedBox(height: Insets.md),
        BookTagField(tag: _tag, onChanged: (t) => setState(() => _tag = t)),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.bitesSpoiler),
          subtitle: Text(l10n.bitesSpoilerHint),
          value: _spoiler && _tag != null,
          onChanged: _tag == null ? null : (v) => setState(() => _spoiler = v),
        ),
        const SizedBox(height: Insets.lg),
        FilledButton(
          onPressed: ok && !_saving ? _save : null,
          child: Text(widget.id == null ? l10n.bitesPost : l10n.bitesSave),
        ),
      ],
    );
  }
}
