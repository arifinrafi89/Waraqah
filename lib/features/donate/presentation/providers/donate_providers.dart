import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/donate_repository_impl.dart';
import '../../data/sources/donate_remote_source.dart';
import '../../domain/entities/recipient.dart';
import '../../domain/repositories/donate_repository.dart';
import '../../domain/usecases/donate_book.dart';
import '../../domain/usecases/get_recipient.dart';
import '../../domain/usecases/get_recipients.dart';

final donateRepositoryProvider = Provider<DonateRepository>(
  (ref) => DonateRepositoryImpl(DonateRemoteSource(ref.watch(dioProvider))),
);

final getRecipientsProvider = Provider<GetRecipients>(
  (ref) => GetRecipients(ref.watch(donateRepositoryProvider)),
);

final getRecipientProvider = Provider<GetRecipient>(
  (ref) => GetRecipient(ref.watch(donateRepositoryProvider)),
);

final donateBookProvider = Provider<DonateBook>(
  (ref) => DonateBook(ref.watch(donateRepositoryProvider)),
);

/// Every verified place taking books.
final recipientsProvider = FutureProvider.autoDispose<List<Recipient>>(
  (ref) => ref.watch(getRecipientsProvider).call(const NoParams()),
);

/// One place and what it still needs; `null` for an unknown id.
final recipientProvider = FutureProvider.autoDispose.family<Recipient?, String>(
  (ref, id) => ref.watch(getRecipientProvider).call(id),
);
