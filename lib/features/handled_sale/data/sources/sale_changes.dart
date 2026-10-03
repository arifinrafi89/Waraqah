import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// The fake backend's live feed of sale changes: one `data: {saleId}`
/// line per change, the way `/inbox/live` streams thread changes.
class SaleChanges {
  final StreamController<Map<String, Object>> _changes =
      StreamController.broadcast();
  int _seq = 0;

  /// Tells listening apps [saleId] changed.
  void sale(String saleId) => _changes.add({'seq': ++_seq, 'saleId': saleId});

  /// A server-sent events response that stays open while the app listens.
  ResponseBody stream() => ResponseBody(
    _changes.stream.map(
      (change) =>
          Uint8List.fromList(utf8.encode('data: ${jsonEncode(change)}\n\n')),
    ),
    200,
    headers: {
      Headers.contentTypeHeader: ['text/event-stream'],
    },
  );
}
