import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/admin_section.dart';

/// How an [AdminSection] is shown: its icon, name and one-line hint.
extension AdminSectionLabels on AdminSection {
  IconData get icon => switch (this) {
    AdminSection.dashboard => Icons.space_dashboard_outlined,
    AdminSection.catalog => Icons.menu_book_outlined,
    AdminSection.orders => Icons.receipt_long_outlined,
    AdminSection.moderation => Icons.verified_user_outlined,
    AdminSection.tradeIn => Icons.swap_horiz_rounded,
    AdminSection.donations => Icons.volunteer_activism_outlined,
  };

  String label(AppL10n l10n) => switch (this) {
    AdminSection.dashboard => l10n.adminDashboard,
    AdminSection.catalog => l10n.adminCatalog,
    AdminSection.orders => l10n.adminOrders,
    AdminSection.moderation => l10n.adminModeration,
    AdminSection.tradeIn => l10n.sellBackAdminTitle,
    AdminSection.donations => l10n.adminDonate,
  };

  String hint(AppL10n l10n) => switch (this) {
    AdminSection.dashboard => l10n.adminDashboardHint,
    AdminSection.catalog => l10n.adminCatalogHint,
    AdminSection.orders => l10n.adminOrdersHint,
    AdminSection.moderation => l10n.adminModerationHint,
    AdminSection.tradeIn => l10n.sellBackAdminHint,
    AdminSection.donations => l10n.adminDonateHint,
  };
}
