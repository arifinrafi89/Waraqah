/// What a signed-in account is allowed to do.
///
/// A guest has no role at all: the session is simply `null`.
enum UserRole { reader, moderator, catalogManager, support, superAdmin }

extension UserRoleX on UserRole {
  /// Staff can open the admin area.
  bool get isStaff => this != UserRole.reader;

  /// Approve used-book listings and handle reports.
  bool get canModerate =>
      this == UserRole.moderator || this == UserRole.superAdmin;

  /// Add and edit books, stock, collections and banners.
  bool get canManageCatalog =>
      this == UserRole.catalogManager || this == UserRole.superAdmin;

  /// Handle orders, returns and refunds.
  bool get canManageOrders =>
      this == UserRole.support || this == UserRole.superAdmin;
}
