import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import '../providers/bite_providers.dart';
import '../widgets/bite_feed_card.dart';
import '../widgets/bite_feed_skeleton.dart';
import '../widgets/bite_composer_sheet.dart';

class BitesPage extends ConsumerStatefulWidget {
  const BitesPage({super.key});

  @override
  ConsumerState<BitesPage> createState() => _BitesPageState();
}

class _BitesPageState extends ConsumerState<BitesPage> {
  final _postedBites = <Bite>[];
  final _likedIds = <String>{};

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final feed = ref.watch(biteFeedProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.bitesTitle)),
      body: feed.when(
        loading: () => ListView(
          padding: const EdgeInsets.fromLTRB(
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
          padding: const EdgeInsets.fromLTRB(
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
    final text = await showBiteComposer(context);
    if (!mounted || text == null || text.isEmpty) return;
    final l10n = AppL10n.of(context)!;
    setState(
      () => _postedBites.insert(
        0,
        Bite(
          id: 'local-${DateTime.now().microsecondsSinceEpoch}',
          authorName: l10n.bitesYou,
          authorHandle: l10n.bitesReaderHandle,
          text: text,
        ),
      ),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.bitesPosted)));
  }
}
