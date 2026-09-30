import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';

/// A row of small return photos; tapping one shows it full size, with
/// pinch to zoom.
class ReturnPhotos extends StatelessWidget {
  const ReturnPhotos({super.key, required this.photos});

  final List<Uint8List> photos;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Insets.sm,
      runSpacing: Insets.sm,
      children: [
        for (final photo in photos)
          InkWell(
            onTap: () => showDialog<void>(
              context: context,
              builder: (dialog) => Dialog(
                clipBehavior: Clip.antiAlias,
                child: InteractiveViewer(child: Image.memory(photo)),
              ),
            ),
            borderRadius: BorderRadius.circular(Radii.sm),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Radii.sm),
              child: Image.memory(
                photo,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
