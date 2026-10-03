import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import 'listing_photo_caption.dart';

/// One photo slot: the picked photo, one the server already has, or an
/// empty tile to tap. A needed slot says so until it has a photo.
class ListingPhotoTile extends StatelessWidget {
  const ListingPhotoTile({
    super.key,
    required this.label,
    required this.bytes,
    required this.held,
    required this.needed,
    required this.onPick,
    required this.onRemove,
  });

  final String label;
  final Uint8List? bytes;

  /// Has a photo: just picked ([bytes]) or uploaded before.
  final bool held;
  final bool needed;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final picked = bytes;
    final caption = held
        ? (picked == null ? l10n.listingPhotoSaved : null)
        : (needed ? l10n.listingPhotoNeeded : null);
    return Semantics(
      button: !held,
      label: label,
      child: Material(
        color: palette.surface2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.sm),
          side: BorderSide(
            color: !held && needed ? palette.accent : palette.border,
          ),
        ),
        child: InkWell(
          onTap: held ? null : onPick,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (picked != null) Image.memory(picked, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (picked == null)
                      Expanded(
                        child: Center(
                          child: Icon(
                            held
                                ? Icons.check_circle_rounded
                                : Icons.add_a_photo_outlined,
                            color: palette.accent,
                            semanticLabel: held ? null : l10n.listingPhotoAdd,
                          ),
                        ),
                      ),
                    ListingPhotoCaption(label),
                    if (caption != null)
                      ListingPhotoCaption(caption, faint: true),
                  ],
                ),
              ),
              if (held)
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: IconButton(
                    tooltip: l10n.listingPhotoRemove,
                    visualDensity: VisualDensity.compact,
                    iconSize: 18,
                    color: palette.text,
                    icon: const Icon(Icons.cancel_rounded),
                    onPressed: onRemove,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
