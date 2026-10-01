import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../inbox_routes.dart';
import '../providers/inbox_providers.dart';

/// The inbox icon for a header. Its badge counts new offers and messages
/// and changes live, so it's the only notification there is. Guests are
/// asked to log in.
class InboxButton extends ConsumerWidget {
  const InboxButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedIn = ref.watch(sessionProvider) != null;
    final unread = ref.watch(inboxUnreadProvider);
    return AppIconButton(
      icon: Icons.forum_outlined,
      tooltip: AppL10n.of(context)!.inboxTitle,
      badgeCount: unread > 0 ? unread : null,
      onPressed: () =>
          context.push(signedIn ? InboxRoutes.inbox : AuthRoutes.login),
    );
  }
}
