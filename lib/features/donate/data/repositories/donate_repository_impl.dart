import '../../domain/entities/donate_place_draft.dart';
import '../../domain/entities/donation.dart';
import '../../domain/entities/recipient.dart';
import '../../domain/repositories/donate_repository.dart';
import '../models/recipient_model.dart';
import '../sources/donate_remote_source.dart';

/// No cache: how many books a place still needs changes with every
/// donation.
class DonateRepositoryImpl implements DonateRepository {
  DonateRepositoryImpl(this._source);

  final DonateRemoteSource _source;

  @override
  Future<List<Recipient>> recipients() async => [
    for (final recipient in await _source.recipients()) recipient.toEntity(),
  ];

  @override
  Future<Recipient?> recipient(String id) async =>
      (await _source.recipient(id))?.toEntity();

  @override
  Future<Donation> donate(DonationRequest request) async =>
      (await _source.donate(request)).toEntity();

  @override
  Future<List<Recipient>> savePlace(DonatePlaceDraft draft) async => [
    for (final r in await _source.savePlace(draft)) r.toEntity(),
  ];

  @override
  Future<List<Recipient>> removePlace(String id) async => [
    for (final r in await _source.removePlace(id)) r.toEntity(),
  ];
}
