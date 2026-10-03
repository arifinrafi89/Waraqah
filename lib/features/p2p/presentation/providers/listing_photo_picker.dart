import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// Picks one photo of the seller's copy from the gallery, shrunk so the
/// upload stays small; `null` when they cancel. Tests override it.
final listingPhotoPickerProvider = Provider<Future<Uint8List?> Function()>(
  (ref) => () async {
    try {
      final file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1280,
        imageQuality: 70,
      );
      return await file?.readAsBytes();
    } catch (_) {
      // The reader closed the picker or denied access: nothing to add.
      return null;
    }
  },
);
