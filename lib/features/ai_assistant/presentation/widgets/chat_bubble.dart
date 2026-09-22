import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/chat_message.dart';
import 'recommendation_card.dart';
import 'vendor_quote_table.dart';

/// One chat turn. User turns fill with the accent colour and sit on the right;
/// assistant turns are bordered surface cards on the left and may carry a
/// recommendation card and a price table.
class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isUser = message.isUser;
    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      decoration: BoxDecoration(
        color: isUser ? palette.accent : palette.surface,
        border: isUser ? null : Border.all(color: palette.border),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isUser ? Radii.card : 5),
          topRight: Radius.circular(isUser ? 5 : Radii.card),
          bottomLeft: const Radius.circular(Radii.card),
          bottomRight: const Radius.circular(Radii.card),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: AppFonts.ui(
              size: 12.5,
              height: 1.55,
              weight: isUser ? FontWeight.w600 : FontWeight.w500,
              color: isUser ? palette.accentInk : palette.text,
            ),
          ),
          if (message.hasRecommendation)
            RecommendationCard(bookId: message.recommendedBookId!),
          if (message.quotes.isNotEmpty)
            VendorQuoteTable(quotes: message.quotes),
        ],
      ),
    );

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.8,
        ),
        child: isUser
            ? bubble
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Insets.sm,
                children: [_avatar(palette), Flexible(child: bubble)],
              ),
      ),
    );
  }

  Widget _avatar(AppPalette palette) => Container(
    width: 24,
    height: 24,
    margin: const EdgeInsets.only(top: 2),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: palette.accent,
      borderRadius: BorderRadius.circular(Radii.sm),
    ),
    child: Icon(
      Icons.auto_awesome_rounded,
      size: 13,
      color: palette.accentInk,
    ),
  );
}
