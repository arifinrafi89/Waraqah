import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

/// Shares a quote card's PNG through the system share sheet. Tests
/// override it.
final quoteSharerProvider = Provider<Future<void> Function(Uint8List png)>(
  (ref) =>
      (png) => SharePlus.instance.share(
        ShareParams(
          files: [
            XFile.fromData(
              png,
              mimeType: 'image/png',
              name: 'waraqah-quote.png',
            ),
          ],
          fileNameOverrides: const ['waraqah-quote.png'],
        ),
      ),
);
