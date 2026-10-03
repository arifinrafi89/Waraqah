import 'package:dio/dio.dart';

import '../../domain/entities/shelf_entry.dart';
import '../models/shelf_entry_model.dart';
import 'shelf_fake_api.dart';

/// Talks to the `/shelves` endpoints, answered for now by the fake API.
/// A refused move (`null`) is an error, shown by the page.
class ShelfRemoteSource {
  ShelfRemoteSource(this._dio);

  final Dio _dio;

  Future<List<ShelfEntryModel>> mine() async =>
      _list(await _dio.get<List<dynamic>>(ShelfFakeApi.mine));

  Future<List<ShelfEntryModel>> move(ShelfMove move) async => _list(
    await _dio.post<List<dynamic>>(
      ShelfFakeApi.move,
      data: {'bookId': move.bookId, 'shelf': ?move.shelf?.name},
    ),
  );

  List<ShelfEntryModel> _list(Response<List<dynamic>> response) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return [
      for (final json in data)
        ShelfEntryModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}
