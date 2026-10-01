import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/entities/order_status.dart';

/// Reader-facing words for orders, in the current language.
extension OrderLabels on AppL10n {
  String orderStatus(OrderStatus status) => switch (status) {
    OrderStatus.placed => orderStatusPlaced,
    OrderStatus.confirmed => orderStatusConfirmed,
    OrderStatus.packed => orderStatusPacked,
    OrderStatus.shipped => orderStatusShipped,
    OrderStatus.delivered => orderStatusDelivered,
    OrderStatus.cancelled => orderStatusCancelled,
  };

  String returnReason(ReturnReason reason) => switch (reason) {
    ReturnReason.damaged => orderReturnDamaged,
    ReturnReason.wrongBook => orderReturnWrongBook,
    ReturnReason.other => orderReturnOther,
  };

  String returnStatus(ReturnStatus status) => switch (status) {
    ReturnStatus.requested => orderReturnRequested,
    ReturnStatus.approved => orderReturnApproved,
    ReturnStatus.rejected => orderReturnRejected,
  };
}

/// Dates and times in the reader's language: "24 Sep 2026", "24 Sep, 3:05 PM".
extension OrderDates on BuildContext {
  String _locale() => Localizations.localeOf(this).toLanguageTag();

  String orderDate(DateTime at) => DateFormat.yMMMd(_locale()).format(at);

  String orderTime(DateTime at) =>
      DateFormat.MMMd(_locale()).add_jm().format(at);
}
