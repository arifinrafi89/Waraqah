import '../../../auth/domain/entities/user_role.dart';

/// One area of work inside the Admin area, in menu order.
///
/// This list drives both the hub menu and the route guard, so a section's
/// visibility and its access rule can't disagree. Add new sections here.
enum AdminSection {
  dashboard,
  catalog,
  orders,
  moderation,

  /// Grading Sell Back books (Arifin).
  tradeIn,

  /// The verified places Donations go to (Arifin).
  donations;

  /// Whether [role] may open this section.
  bool canOpen(UserRole role) => switch (this) {
    dashboard => role.isStaff,
    catalog => role.canManageCatalog,
    orders => role.canManageOrders,
    moderation => role.canModerate,
    tradeIn => role.canManageCatalog,
    donations => role.canManageOrders,
  };
}
