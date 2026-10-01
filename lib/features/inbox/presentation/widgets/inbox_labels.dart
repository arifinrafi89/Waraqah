import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';

/// Reader-facing words for the inbox, in the current language.
extension InboxLabels on AppL10n {
  String handoverName(OfferHandover handover) => switch (handover) {
    OfferHandover.meetup => offerMeetup,
    OfferHandover.courier => offerCourier,
  };

  String offerStatusName(OfferStatus status) => switch (status) {
    OfferStatus.pending => offerStatusPending,
    OfferStatus.accepted => offerStatusAccepted,
    OfferStatus.declined => offerStatusDeclined,
    OfferStatus.closed => offerStatusClosed,
  };

  /// A deal line, told from the reader's side: "Nabila accepted your
  /// offer of ৳400…" or "You accepted Sadia's offer…".
  String eventText(InboxMessage message, InboxThread thread) {
    final name = thread.otherName;
    final amount = Bdt.format(message.amountBdt ?? 0);
    final byMe = message.from == MessageFrom.me;
    return switch (message.event!) {
      ThreadEvent.offerAccepted =>
        byMe
            ? chatEventAcceptedByMe(name, amount)
            : chatEventAcceptedByThem(name, amount),
      ThreadEvent.offerDeclined =>
        byMe
            ? chatEventDeclinedByMe(name, amount)
            : chatEventDeclinedByThem(name, amount),
      ThreadEvent.reservedElsewhere => chatEventReservedElsewhere,
      ThreadEvent.madeAvailable =>
        byMe ? chatEventAvailableByMe : chatEventAvailableByThem(name),
      ThreadEvent.sold =>
        byMe ? chatEventSoldByMe(name) : chatEventSoldByThem(name),
      ThreadEvent.soldElsewhere => chatEventSoldElsewhere,
    };
  }

  /// The inbox list's one-line preview of the latest message.
  String preview(InboxThread thread) {
    final message = thread.lastMessage;
    if (message == null) return '';
    if (message.offer case final offer?) {
      final what = offerCardTitle(Bdt.format(offer.amountBdt));
      return message.from == MessageFrom.me ? chatYou(what) : what;
    }
    if (message.event != null) return eventText(message, thread);
    final text = message.text ?? '';
    return message.from == MessageFrom.me ? chatYou(text) : text;
  }
}

/// "5:02 PM" today, "Sep 28" before that, in the current language.
String messageTime(BuildContext context, DateTime at) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  final now = DateTime.now();
  final today =
      at.year == now.year && at.month == now.month && at.day == now.day;
  return (today ? DateFormat.jm(locale) : DateFormat.MMMd(locale)).format(at);
}
