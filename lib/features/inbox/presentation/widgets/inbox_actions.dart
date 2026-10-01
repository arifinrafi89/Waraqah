import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../../domain/usecases/make_offer.dart';
import '../../inbox_routes.dart';
import '../providers/inbox_use_case_providers.dart';
import 'offer_sheet.dart';

/// How any page starts talking to a seller. Guests log in first; both
/// land in the one thread the buyer has about that listing.
extension InboxActions on WidgetRef {
  /// "Message": opens the conversation about the listing.
  Future<void> openChat(BuildContext context, P2pListing listing) async {
    final router = GoRouter.of(context);
    if (read(sessionProvider) == null) {
      router.push(AuthRoutes.login);
      return;
    }
    await _go(context, () => read(openThreadProvider).call(listing.id));
  }

  /// "Make an offer": the short form, then the conversation with the offer
  /// in it.
  Future<void> offerOn(BuildContext context, P2pListing listing) async {
    if (read(sessionProvider) == null) {
      GoRouter.of(context).push(AuthRoutes.login);
      return;
    }
    final draft = await showOfferSheet(
      context,
      sellerName: listing.sellerName,
      askingBdt: listing.priceBdt,
      negotiable: listing.isNegotiable,
      preferred: listing.handover,
    );
    if (draft == null || !context.mounted) return;
    final sent = AppL10n.of(context)!.offerSent(listing.sellerName);
    final params = MakeOfferParams(
      request: OfferRequest(
        listingId: listing.id,
        amountBdt: draft.amountBdt,
        handover: draft.handover,
      ),
      askingBdt: listing.priceBdt,
      negotiable: listing.isNegotiable,
    );
    await _go(context, () => read(makeOfferProvider).call(params), sent);
  }

  Future<void> _go(
    BuildContext context,
    Future<InboxThread> Function() action, [
    String? done,
  ]) async {
    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      final thread = await action();
      router.push(InboxRoutes.threadFor(thread.id));
      if (done != null) messenger.showSnackBar(SnackBar(content: Text(done)));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
