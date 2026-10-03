import 'dart:typed_data';

import '../../../../core/usecase/usecase.dart';
import '../entities/p2p_listing.dart';
import '../repositories/p2p_repository.dart';

/// What the add-listing form sends: the Listing, the photos picked since
/// it was last saved (by slot), and whether it goes for review.
final class SaveListingParams {
  const SaveListingParams(
    this.listing, {
    this.newPhotos = const {},
    required this.submit,
  });

  final P2pListing listing;
  final Map<String, Uint8List> newPhotos;
  final bool submit;
}

/// Saves the reader's own Listing as a draft, or sends it for review.
/// Answers the Listing as the server keeps it.
class SaveListing extends UseCase<P2pListing, SaveListingParams> {
  SaveListing(this._repository);

  final P2pRepository _repository;

  @override
  Future<P2pListing> call(SaveListingParams params) =>
      _repository.saveListing(params);
}
