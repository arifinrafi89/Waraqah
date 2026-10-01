import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';

/// Why the balance changed: money back from a cancelled or returned order,
/// a used book sold back to Waraqah, or spent at checkout.
enum WalletReason { cancelRefund, returnRefund, sellBack, spent }

/// One change to the balance, in taka: positive in, negative out.
@freezed
abstract class WalletEntry with _$WalletEntry {
  const factory WalletEntry({
    required int amountBdt,
    required WalletReason reason,
    required DateTime at,
    String? orderNumber,

    /// What it was for when there's no order, e.g. the book sold back.
    String? note,
  }) = _WalletEntry;
}

/// Taka the reader holds with Waraqah, spent at checkout like cash, and
/// how it got there, newest first.
@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    @Default(0) int balanceBdt,
    @Default(<WalletEntry>[]) List<WalletEntry> entries,
  }) = _Wallet;
}
