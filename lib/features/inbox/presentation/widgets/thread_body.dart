import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../report/presentation/providers/report_providers.dart';
import '../../../report/presentation/widgets/blocked_seller_bar.dart';
import '../../domain/entities/inbox_thread.dart';
import 'composer.dart';
import 'deal_banner.dart';
import 'listing_pin.dart';
import 'message_list.dart';
import 'rating_card.dart';

/// The book on top, where the deal stands, the conversation, and the box
/// to write in (or, with a blocked reader, a note saying so).
class ThreadBody extends ConsumerWidget {
  const ThreadBody({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: Column(
            spacing: Insets.sm,
            children: [
              ListingPin(listing: thread.listing),
              DealBanner(thread: thread),
              RatingCard(thread: thread),
            ],
          ),
        ),
        Expanded(child: MessageList(thread: thread)),
        if (ref.watch(isBlockedProvider(thread.otherId)))
          BlockedSellerBar(
            readerId: thread.otherId,
            name: thread.otherName,
            inThread: true,
          )
        else
          Composer(thread: thread),
      ],
    );
  }
}
