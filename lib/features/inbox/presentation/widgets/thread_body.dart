import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../domain/entities/inbox_thread.dart';
import 'composer.dart';
import 'deal_banner.dart';
import 'listing_pin.dart';
import 'message_list.dart';
import 'rating_card.dart';

/// The book on top, where the deal stands, the conversation, and the box
/// to write in.
class ThreadBody extends StatelessWidget {
  const ThreadBody({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context) {
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
        Composer(thread: thread),
      ],
    );
  }
}
