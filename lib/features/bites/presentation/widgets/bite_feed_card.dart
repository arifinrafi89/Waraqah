import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/tags.dart';
import '../../../catalog/catalog_routes.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite.dart';
import 'bite_actions_bar.dart';
import 'bite_author_row.dart';
import 'bite_body.dart';

/// One Bite in a feed: author, text (blurred when a spoiler), the tagged
/// Book and the like, comment and share actions.
class BiteFeedCard extends StatelessWidget {
  const BiteFeedCard({super.key, required this.bite, this.inDetail = false});

  final Bite bite;

  /// On the detail page itself: the comments button does nothing.
  final bool inDetail;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: Insets.md),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(Insets.lg, Insets.md, Insets.sm, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BiteAuthorRow(bite: bite),
          Padding(
            padding: const EdgeInsets.only(right: Insets.md, top: Insets.sm),
            child: BiteBody(bite: bite),
          ),
          if (bite.hasBookTag)
            Padding(
              padding: const EdgeInsets.only(top: Insets.sm),
              child: InkWell(
                onTap: () =>
                    context.push(CatalogRoutes.bookDetailFor(bite.bookId!)),
                borderRadius: BorderRadius.circular(Radii.sm),
                child: AccentTag(label: bite.bookTitle!),
              ),
            ),
          BiteActionsBar(
            bite: bite,
            onComments: inDetail
                ? null
                : () => context.push(BitesRoutes.detailFor(bite.id)),
          ),
        ],
      ),
    ),
  );
}
