import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_return.dart';

/// Up to three photos for a return: the ones picked so far, each with a
/// remove button, and an add tile while there's room.
class ReturnPhotosPicker extends StatelessWidget {
  const ReturnPhotosPicker({
    super.key,
    required this.photos,
    required this.onChanged,
  });

  final List<Uint8List> photos;
  final ValueChanged<List<Uint8List>> onChanged;

  static const double _tile = 64;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Wrap(
          spacing: Insets.sm,
          runSpacing: Insets.sm,
          children: [
            for (var i = 0; i < photos.length; i++)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Radii.sm),
                    child: Image.memory(
                      photos[i],
                      width: _tile,
                      height: _tile,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: -6,
                    right: -6,
                    child: IconButton(
                      tooltip: l10n.orderReturnRemovePhoto,
                      visualDensity: VisualDensity.compact,
                      iconSize: 18,
                      color: Colors.white,
                      icon: const Icon(Icons.cancel_rounded),
                      onPressed: () => onChanged([...photos]..removeAt(i)),
                    ),
                  ),
                ],
              ),
            if (photos.length < maxReturnPhotos)
              Tooltip(
                message: l10n.orderReturnAddPhotos,
                child: InkWell(
                  onTap: _pick,
                  borderRadius: BorderRadius.circular(Radii.sm),
                  child: Container(
                    width: _tile,
                    height: _tile,
                    decoration: BoxDecoration(
                      border: Border.all(color: palette.border),
                      borderRadius: BorderRadius.circular(Radii.sm),
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: palette.accent,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Text(
          l10n.orderReturnPhotosHelp,
          style: AppFonts.ui(size: 11, color: palette.textFaint),
        ),
      ],
    );
  }

  /// Opens the gallery. Pictures are shrunk so the upload stays small.
  Future<void> _pick() async {
    final picker = ImagePicker();
    final room = maxReturnPhotos - photos.length;
    try {
      final picked = room == 1
          ? [
              ?await picker.pickImage(
                source: ImageSource.gallery,
                maxWidth: 1280,
                imageQuality: 70,
              ),
            ]
          : await picker.pickMultiImage(
              maxWidth: 1280,
              imageQuality: 70,
              limit: room,
            );
      final bytes = await Future.wait(picked.map((file) => file.readAsBytes()));
      if (bytes.isNotEmpty) onChanged([...photos, ...bytes.take(room)]);
    } catch (_) {
      // The reader closed the picker or denied access: nothing to add.
    }
  }
}
