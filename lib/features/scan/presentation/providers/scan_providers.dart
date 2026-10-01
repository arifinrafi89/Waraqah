import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/scan_repository_impl.dart';
import '../../data/sources/scan_remote_source.dart';
import '../../domain/entities/scanned_book.dart';
import '../../domain/repositories/scan_repository.dart';
import '../../domain/usecases/look_up_isbn.dart';
import 'camera_support_web.dart' if (dart.library.io) 'camera_support_io.dart';

final scanRepositoryProvider = Provider<ScanRepository>(
  (ref) => ScanRepositoryImpl(ScanRemoteSource(ref.watch(dioProvider))),
);

final lookUpIsbnProvider = Provider<LookUpIsbn>(
  (ref) => LookUpIsbn(ref.watch(scanRepositoryProvider)),
);

/// The catalog Book for an ISBN, `null` when Waraqah doesn't have it.
final scannedBookProvider = FutureProvider.autoDispose
    .family<ScannedBook?, String>(
      (ref, isbn) => ref.watch(lookUpIsbnProvider).call(isbn),
    );

/// Whether this device can scan with its camera: phones, Macs and the web.
/// Elsewhere (and in tests) the reader types the ISBN.
final cameraScanSupportedProvider = Provider<bool>((_) => hasScannerCamera);
