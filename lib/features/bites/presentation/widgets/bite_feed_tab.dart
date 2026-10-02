import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/bite_query.dart';
import '../providers/bite_providers.dart';
import 'bite_feed_card.dart';
import 'bite_feed_skeleton.dart';
import 'bites_message.dart';

/// One feed tab. Following needs a signed-in Reader.
class BiteFeedTab extends ConsumerWidget {
  const BiteFeedTab({super.key, required this.following});

  final bool following;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    if (following && ref.watch(sessionProvider) == null) {
      return BitesMessage(text: l10n.bitesFollowingLogin, logIn: true);
    }
    final query = BiteQuery(following: following);
    return RefreshIndicator(
      onRefresh: () => ref.refresh(bitesProvider(query).future),
      child: AsyncView(
        value: ref.watch(bitesProvider(query)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(bitesProvider(query)),
        skeleton: ListView(
          padding: _padding,
          children: const [BiteFeedSkeleton(), BiteFeedSkeleton()],
        ),
        builder: (bites) => bites.isEmpty
            ? BitesMessage(
                text: following ? l10n.bitesFollowingEmpty : l10n.bitesEmpty,
              )
            : ListView.builder(
                padding: _padding,
                itemCount: bites.length,
                itemBuilder: (_, i) => BiteFeedCard(bite: bites[i]),
              ),
      ),
    );
  }

  static EdgeInsets get _padding => EdgeInsets.fromLTRB(
    Insets.screen,
    Insets.md,
    Insets.screen,
    Sizes.navClearance,
  );
}
