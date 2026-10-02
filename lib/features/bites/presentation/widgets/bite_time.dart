import 'package:flutter/widgets.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../orders/presentation/widgets/order_labels.dart';

/// "now", "5m", "3h", "2d", then the date, in the Reader's language.
extension BiteTime on BuildContext {
  String biteAgo(DateTime at) {
    final l10n = AppL10n.of(this)!;
    final gone = DateTime.now().difference(at);
    if (gone.inMinutes < 1) return l10n.bitesNow;
    if (gone.inHours < 1) return l10n.bitesMinutesAgo(gone.inMinutes);
    if (gone.inDays < 1) return l10n.bitesHoursAgo(gone.inHours);
    if (gone.inDays < 7) return l10n.bitesDaysAgo(gone.inDays);
    return orderDate(at);
  }
}
