import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/decide_offer.dart';
import '../../domain/usecases/get_thread.dart';
import '../../domain/usecases/make_offer.dart';
import '../../domain/usecases/mark_listing_sold.dart';
import '../../domain/usecases/mark_thread_read.dart';
import '../../domain/usecases/open_thread.dart';
import '../../domain/usecases/release_listing.dart';
import '../../domain/usecases/send_message.dart';
import 'inbox_providers.dart';

final getThreadProvider = Provider<GetThread>(
  (ref) => GetThread(ref.watch(inboxRepositoryProvider)),
);

final openThreadProvider = Provider<OpenThread>(
  (ref) => OpenThread(ref.watch(inboxRepositoryProvider)),
);

final sendMessageProvider = Provider<SendMessage>(
  (ref) => SendMessage(ref.watch(inboxRepositoryProvider)),
);

final makeOfferProvider = Provider<MakeOffer>(
  (ref) => MakeOffer(ref.watch(inboxRepositoryProvider)),
);

final decideOfferProvider = Provider<DecideOffer>(
  (ref) => DecideOffer(ref.watch(inboxRepositoryProvider)),
);

final markThreadReadProvider = Provider<MarkThreadRead>(
  (ref) => MarkThreadRead(ref.watch(inboxRepositoryProvider)),
);

final releaseListingProvider = Provider<ReleaseListing>(
  (ref) => ReleaseListing(ref.watch(inboxRepositoryProvider)),
);

final markListingSoldProvider = Provider<MarkListingSold>(
  (ref) => MarkListingSold(ref.watch(inboxRepositoryProvider)),
);
