import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/tags.dart';

/// One Collection or Staff Booklist in the Collections tab: its title and
/// [tags] (book count, Section, Expert or Kind). Opens [route] on tap.
class ListAdminTile extends StatelessWidget {
  const ListAdminTile({
    super.key,
    required this.title,
    required this.tags,
    required this.route,
  });

  final String title;
  final List<String> tags;
  final String route;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: Insets.sm),
    child: Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(title, style: context.texts.titleSmall),
        subtitle: Wrap(
          spacing: 6,
          runSpacing: 4,
          children: [for (final t in tags) MiniTag(label: t, fontSize: 11)],
        ),
        onTap: () => context.push(route),
      ),
    ),
  );
}
