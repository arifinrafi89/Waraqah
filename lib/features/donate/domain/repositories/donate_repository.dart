import '../entities/donation.dart';
import '../entities/recipient.dart';

/// Verified places that take donated books, and giving to them.
abstract interface class DonateRepository {
  Future<List<Recipient>> recipients();

  /// `null` when no verified place has that id.
  Future<Recipient?> recipient(String id);

  /// Places the donation as an order to the recipient.
  Future<Donation> donate(DonationRequest request);
}
