import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// "No end date" or "Until 31 Dec 2026", with a button to pick the last
/// day. The coupon works until the end of that day.
class CouponExpiryRow extends StatelessWidget {
  const CouponExpiryRow({
    super.key,
    required this.expiry,
    required this.onChanged,
  });

  final DateTime? expiry;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final day = expiry;
    return Row(
      children: [
        Expanded(
          child: Text(
            day == null
                ? l10n.adminOrderCouponNoEnd
                : l10n.adminOrderCouponUntil(
                    DateFormat.yMMMd(locale).format(day),
                  ),
            style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
          ),
        ),
        TextButton(
          onPressed: () => _pick(context),
          child: Text(l10n.adminOrderCouponPickDate),
        ),
      ],
    );
  }

  Future<void> _pick(BuildContext context) async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: expiry ?? today.add(const Duration(days: 30)),
      firstDate: today.add(const Duration(days: 1)),
      lastDate: today.add(const Duration(days: 730)),
    );
    if (picked != null) {
      onChanged(DateTime(picked.year, picked.month, picked.day, 23, 59, 59));
    }
  }
}
