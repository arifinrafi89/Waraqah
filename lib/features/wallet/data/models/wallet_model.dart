import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/wallet.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
abstract class WalletEntryModel with _$WalletEntryModel {
  const factory WalletEntryModel({
    required int amountBdt,
    required WalletReason reason,
    required DateTime at,
    String? orderNumber,
    String? note,
  }) = _WalletEntryModel;

  factory WalletEntryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletEntryModelFromJson(json);
}

@freezed
abstract class WalletModel with _$WalletModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory WalletModel({
    @Default(0) int balanceBdt,
    @Default(<WalletEntryModel>[]) List<WalletEntryModel> entries,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

extension WalletModelX on WalletModel {
  Wallet toEntity() => Wallet(
    balanceBdt: balanceBdt,
    entries: [
      for (final e in entries)
        WalletEntry(
          amountBdt: e.amountBdt,
          reason: e.reason,
          at: e.at,
          orderNumber: e.orderNumber,
          note: e.note,
        ),
    ],
  );
}
