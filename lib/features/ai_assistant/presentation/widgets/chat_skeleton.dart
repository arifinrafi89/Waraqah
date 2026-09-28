import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Shimmer placeholder for the conversation while it loads, alternating sides
/// so it reads as a chat straight away.
class ChatSkeleton extends StatelessWidget {
  const ChatSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.lg, Insets.md, Insets.lg, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: const [
          _Bubble(width: 240, height: 64, isUser: false),
          _Bubble(width: 190, height: 40, isUser: true),
          _Bubble(width: 250, height: 120, isUser: false),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.width,
    required this.height,
    required this.isUser,
  });

  final double width;
  final double height;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ShimmerBox(width: width, height: height, radius: Radii.card),
    );
  }
}
