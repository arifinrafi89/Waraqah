import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/buy_listing.dart';
import '../../domain/usecases/open_dispute.dart';
import '../../domain/usecases/request_payout.dart';
import '../../domain/usecases/step_sale.dart';
import 'handled_sale_providers.dart';

final buyListingProvider = Provider<BuyListing>(
  (ref) => BuyListing(ref.watch(handledSaleRepositoryProvider)),
);

final stepSaleProvider = Provider<StepSale>(
  (ref) => StepSale(ref.watch(handledSaleRepositoryProvider)),
);

final openDisputeProvider = Provider<OpenDispute>(
  (ref) => OpenDispute(ref.watch(handledSaleRepositoryProvider)),
);

final requestPayoutProvider = Provider<RequestPayout>(
  (ref) => RequestPayout(ref.watch(handledSaleRepositoryProvider)),
);
