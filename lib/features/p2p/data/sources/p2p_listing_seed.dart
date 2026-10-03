import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_people.dart';

/// A seed listing sold by a demo reader, in their area. The cover
/// colour comes from the id, so it stays the same.
P2pListingModel seedListing(
  String id,
  String title,
  String sellerId,
  int price,
  BookCondition condition, {
  P2pListingStatus status = P2pListingStatus.live,
  String? bookId,
  int? newPrice,
  bool negotiable = false,
  HandoverMethod handover = HandoverMethod.meetInPerson,
  String? note,
  String? categoryId,
  List<String> flags = const [],
  List<String> photos = const [],
}) {
  final seller = P2pPeople.find(sellerId)!;
  return P2pListingModel(
    id: id,
    title: title,
    sellerId: sellerId,
    sellerName: seller.name,
    priceBdt: price,
    condition: condition,
    flags: flags,
    photos: photos,
    status: status,
    isNegotiable: negotiable,
    handover: handover,
    bookId: bookId,
    coverSeed: id.codeUnits.fold(0, (a, b) => a + b),
    district: seller.district,
    area: seller.area,
    categoryId: categoryId,
    newPriceBdt: newPrice,
    note: note,
  );
}
