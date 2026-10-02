import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import '../providers/bite_providers.dart';
import '../widgets/bite_comment_bar.dart';
import '../widgets/bite_comment_list.dart';
import '../widgets/bite_feed_card.dart';
import '../widgets/bite_feed_skeleton.dart';

/// `/bites/detail?id=`: the Bite, its comments with replies indented, and
/// the comment bar. Open to guests.
class BiteDetailPage extends ConsumerStatefulWidget {
  const BiteDetailPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<BiteDetailPage> createState() => _BiteDetailPageState();
}

class _BiteDetailPageState extends ConsumerState<BiteDetailPage> {
  /// The top comment the Reader is replying to.
  BiteComment? _replyTo;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final detail = biteDetailProvider(widget.id);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.bitesBite)),
      body: AsyncView(
        value: ref.watch(detail),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(detail),
        skeleton: const Padding(
          padding: EdgeInsets.all(Insets.screen),
          child: BiteFeedSkeleton(),
        ),
        builder: (d) => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [
                  BiteFeedCard(bite: d.bite, inDetail: true),
                  BiteCommentList(
                    comments: d.comments,
                    onReply: (c) => setState(() => _replyTo = c),
                  ),
                ],
              ),
            ),
            BiteCommentBar(
              biteId: d.bite.id,
              replyTo: _replyTo,
              onCancelReply: () => setState(() => _replyTo = null),
            ),
          ],
        ),
      ),
    );
  }
}
