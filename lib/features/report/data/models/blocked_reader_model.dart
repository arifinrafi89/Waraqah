import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/blocked_reader.dart';

part 'blocked_reader_model.freezed.dart';
part 'blocked_reader_model.g.dart';

/// JSON shape of a [BlockedReader].
@freezed
abstract class BlockedReaderModel with _$BlockedReaderModel {
  const factory BlockedReaderModel({
    required String id,
    required String name,
    required DateTime blockedAt,
  }) = _BlockedReaderModel;

  factory BlockedReaderModel.fromJson(Map<String, dynamic> json) =>
      _$BlockedReaderModelFromJson(json);
}

extension BlockedReaderModelX on BlockedReaderModel {
  BlockedReader toEntity() =>
      BlockedReader(id: id, name: name, blockedAt: blockedAt);
}
