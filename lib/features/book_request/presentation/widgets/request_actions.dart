import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/p2p_routes.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../book_request_routes.dart';
import '../../domain/entities/book_request.dart';
import '../providers/book_request_providers.dart';

/// Sending, closing and following up on book requests.
extension RequestActions on WidgetRef {
  /// Guests log in first. Then the reader's requests, and how many sellers
  /// were told.
  Future<void> sendRequest(BuildContext context, BookRequestDraft draft) async {
    final router = GoRouter.of(context);
    if (read(sessionProvider) == null) {
      router.push(AuthRoutes.login);
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      final request = await read(myRequestsProvider.notifier).create(draft);
      router.pushReplacement(BookRequestRoutes.requests);
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.requestSent(request.notifiedSellers))),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  Future<void> closeRequest(BuildContext context, String id) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      await read(myRequestsProvider.notifier).close(id);
      messenger.showSnackBar(SnackBar(content: Text(l10n.requestClosedDone)));
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  /// The marketplace, searching for the requested title.
  void seeCopies(BuildContext context, BookRequest request) {
    read(p2pQueryProvider.notifier).select(request.title);
    context.go(P2pRoutes.p2p);
  }
}
