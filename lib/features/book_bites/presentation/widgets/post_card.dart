import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../home/domain/models/post.dart';
import '../../../home/domain/models/profile.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.author,
    required this.taggedBook,
    required this.chip,
  });

  final Post post;
  final Profile? author;
  final Book? taggedBook;
  final Color chip;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final name = author?.fullName.split(' ').first ?? 'Reader';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: chip,
                child: Text(
                  name.isEmpty ? '?' : name[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: palette.accentInk,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      author?.fullName ?? 'Reader',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: palette.text),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      author?.university ?? '',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: palette.textFaint),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post.content,
            style: TextStyle(fontSize: 13, height: 1.5, color: palette.textDim),
          ),
          if (taggedBook != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: palette.accentSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '📗 ${taggedBook!.title}',
                style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: palette.accent),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
