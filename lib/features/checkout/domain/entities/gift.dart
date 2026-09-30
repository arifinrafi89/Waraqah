import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift.freezed.dart';

/// An order sent as a gift: who it's for, the message on the card, and
/// whether Waraqah wraps it. Gifts go out with the prices left off.
@freezed
abstract class Gift with _$Gift {
  const Gift._();

  const factory Gift({
    @Default('') String recipientName,
    @Default('') String message,
    @Default(false) bool wrapped,
  }) = _Gift;

  static const int wrapFeeBdt = 40;
  static const int maxMessageLength = 150;

  /// The card needs a name to go on.
  bool get isReady => recipientName.trim().isNotEmpty;
}
