import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import '../providers/bite_providers.dart';
import '../widgets/bite_comments_sheet.dart';
import '../widgets/bite_composer_sheet.dart';
import '../widgets/bite_draft.dart';
import '../widgets/bite_feed_card.dart';
import '../widgets/bite_feed_skeleton.dart';

class BitesPage extends ConsumerStatefulWidget {
  const BitesPage({super.key});

  @override
  ConsumerState<BitesPage> createState() => _BitesPageState();
}

class _BitesPageState extends ConsumerState<BitesPage> {
  final _postedBites = <Bite>[];
  final _likedIds = <String>{};
  final _spoilerIds = <String>{};
  final _revealedSpoilerIds = <String>{};
  final _comments = <String, List<BiteComment>>{};

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final feed = ref.watch(biteFeedProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.bitesTitle),
        actions: [
          IconButton(
            tooltip: l10n.bitesPost,
            icon: const Icon(Icons.add_rounded),
            onPressed: _openComposer,
          ),
        ],
      ),
      body: feed.when(
        loading: () => ListView(
          padding: EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.sm,
            Insets.screen,
            Sizes.navClearance,
          ),
          children: const [
            BiteFeedSkeleton(),
            BiteFeedSkeleton(),
            BiteFeedSkeleton(),
          ],
        ),
        error: (_, _) => Center(child: Text(l10n.commonSomethingWentWrong)),
        data: (bites) => ListView.builder(
          padding: EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.sm,
            Insets.screen,
            Sizes.navClearance,
          ),
          itemCount: bites.length + _postedBites.length,
          itemBuilder: (context, index) {
            final bite = index < _postedBites.length
                ? _postedBites[index]
                : bites[index - _postedBites.length];
            return BiteFeedCard(
              bite: _withLikeState(bite),
              onLike: () => _toggleLike(bite),
              onComments: () => _openComments(bite),
              onShare: () => _shareBite(bite),
              onEdit: _isMine(bite) ? () => _editBite(bite) : null,
              onDelete: _isMine(bite) ? () => _deleteBite(bite) : null,
              isSpoiler: _spoilerIds.contains(bite.id),
              spoilerRevealed: _revealedSpoilerIds.contains(bite.id),
              onRevealSpoiler: () =>
                  setState(() => _revealedSpoilerIds.add(bite.id)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openComposer,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Bite _withLikeState(Bite bite) {
    final liked = _likedIds.contains(bite.id) ? !bite.liked : bite.liked;
    final likes = bite.likes + (liked == bite.liked ? 0 : (liked ? 1 : -1));
    return bite.copyWith(liked: liked, likes: likes);
  }

  void _toggleLike(Bite bite) => setState(() {
    if (!_likedIds.add(bite.id)) _likedIds.remove(bite.id);
  });

  Future<void> _openComposer() async {
    final draft = await showBiteComposer(context);
    if (!mounted || draft == null || draft.text.isEmpty) return;
    final l10n = AppL10n.of(context)!;
    final bite = Bite(
      id: 'local-${DateTime.now().microsecondsSinceEpoch}',
      authorName: l10n.bitesYou,
      authorHandle: l10n.bitesReaderHandle,
      text: draft.text,
      taggedBookTitle: draft.book?.title,
      taggedBookId: draft.book?.id,
    );
    setState(() {
      _postedBites.insert(0, bite);
      if (draft.isSpoiler) _spoilerIds.add(bite.id);
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.bitesPosted)));
  }

  bool _isMine(Bite bite) => bite.id.startsWith('local-');

  Future<void> _editBite(Bite bite) async {
    final draft = await showBiteComposer(
      context,
      initial: BiteDraft(
        text: bite.text,
        book: bite.taggedBookId == null
            ? null
            : BiteBookOption(
                id: bite.taggedBookId!,
                title: bite.taggedBookTitle!,
              ),
        isSpoiler: _spoilerIds.contains(bite.id),
      ),
    );
    if (!mounted || draft == null) return;
    final updated = bite.copyWith(
      text: draft.text,
      taggedBookTitle: draft.book?.title,
      taggedBookId: draft.book?.id,
    );
    setState(() {
      final index = _postedBites.indexWhere((item) => item.id == bite.id);
      if (index >= 0) _postedBites[index] = updated;
      if (draft.isSpoiler) {
        _spoilerIds.add(bite.id);
      } else {
        _spoilerIds.remove(bite.id);
        _revealedSpoilerIds.remove(bite.id);
      }
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(AppL10n.of(context)!.bitesEdited)));
  }

  Future<void> _deleteBite(Bite bite) async {
    final l10n = AppL10n.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.bitesDelete),
        content: Text(l10n.bitesDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: Text(l10n.profileCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(l10n.bitesDelete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _postedBites.removeWhere((item) => item.id == bite.id));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.bitesDeleted)));
  }

  Future<void> _openComments(Bite bite) async {
    final result = await showBiteComments(context, _comments[bite.id] ?? []);
    if (mounted && result != null) {
      setState(() => _comments[bite.id] = result);
    }
  }

  Future<void> _shareBite(Bite bite) async {
    await Clipboard.setData(
      ClipboardData(text: 'https://waraqah.app/bites/${bite.id}'),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppL10n.of(context)!.bitesShare)));
  }
}
