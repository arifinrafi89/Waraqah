import 'package:freezed_annotation/freezed_annotation.dart';

part 'reorder_result.freezed.dart';

/// What "Buy again" managed: how many of the order's books went back in
/// the cart, and how many can't be bought again (sold out, a one-of-a-kind
/// used copy, or a bundle).
@freezed
abstract class ReorderResult with _$ReorderResult {
  const factory ReorderResult({
    @Default(0) int added,
    @Default(0) int skipped,
  }) = _ReorderResult;
}
