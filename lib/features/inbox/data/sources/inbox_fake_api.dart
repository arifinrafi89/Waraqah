import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../domain/entities/inbox_message.dart';
import 'inbox_fake_actions.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_selling.dart';
import 'inbox_fake_store.dart';

/// The inbox's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer the thread, or `null` when
/// they aren't allowed.
abstract final class InboxFakeApi {
  /// Threads with messages, newest first, each with its latest message.
  /// `?listingId=` keeps those about one listing.
  static const String threads = '/inbox';

  /// `?id=`: the whole thread.
  static const String thread = '/inbox/thread';

  /// Body `{listingId}`: the buyer's thread, started if needed.
  static const String open = '/inbox/open';

  /// Body `{threadId, text}`.
  static const String send = '/inbox/send';

  /// Body `{listingId, amountBdt, handover}`.
  static const String offer = '/inbox/offer';

  /// Body `{threadId, offerId, accept}`.
  static const String decide = '/inbox/offer/decide';

  /// Body `{threadId}`.
  static const String read = '/inbox/read';

  /// Body `{threadId}`: the seller makes the book available again.
  static const String release = '/inbox/listing/release';

  /// Body `{threadId}`: the seller marks it sold to this buyer.
  static const String sold = '/inbox/listing/sold';

  /// A stream of server-sent events, one `data: {seq, threadId,
  /// listingId}` per change, kept open while the app listens.
  static const String live = '/inbox/live';

  static Map<String, Object? Function(RequestOptions)> routes(
    InboxFakeStore store,
  ) {
    Map<String, dynamic>? answer(FakeThread? thread) =>
        thread == null ? null : store.json(thread);
    return {
      threads: (o) =>
          store.list(listingId: o.queryParameters['listingId'] as String?),
      thread: (o) => answer(store.threads[o.queryParameters['id']]),
      open: (o) => answer(store.openFor(_text(o, 'listingId'))),
      send: (o) => answer(store.send(_text(o, 'threadId'), _text(o, 'text'))),
      offer: (o) => answer(
        store.offer(
          _text(o, 'listingId'),
          _body(o)['amountBdt'] as int? ?? 0,
          OfferHandover.values.byName(_text(o, 'handover')),
        ),
      ),
      decide: (o) => answer(
        store.decide(
          _text(o, 'threadId'),
          _text(o, 'offerId'),
          accept: _body(o)['accept'] == true,
        ),
      ),
      read: (o) => answer(store.readUp(store.threads[_text(o, 'threadId')])),
      release: (o) => answer(store.release(_text(o, 'threadId'))),
      sold: (o) => answer(store.markSold(_text(o, 'threadId'))),
      live: (_) => ResponseBody(
        store.changes.map(
          (change) => Uint8List.fromList(
            utf8.encode('data: ${jsonEncode(change)}\n\n'),
          ),
        ),
        200,
        headers: {
          Headers.contentTypeHeader: ['text/event-stream'],
        },
      ),
    };
  }

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _text(RequestOptions options, String key) =>
      _body(options)[key] as String? ?? '';
}
