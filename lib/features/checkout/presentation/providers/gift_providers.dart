import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/gift.dart';

/// The gift details at checkout, or `null` when the order isn't a gift.
class GiftNotifier extends Notifier<Gift?> {
  @override
  Gift? build() => null;

  void start() => state = const Gift();

  void clear() => state = null;

  void edit(Gift Function(Gift gift) change) {
    if (state case final gift?) state = change(gift);
  }
}

final giftProvider = NotifierProvider<GiftNotifier, Gift?>(GiftNotifier.new);
