import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../l10n/app_localizations.dart';
import 'profile_avatar.dart';

/// The avatar with Change photo and, once there is one, Remove photo. A
/// picked photo is shrunk so the upload stays small.
class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({
    super.key,
    required this.name,
    required this.photo,
    required this.onChanged,
  });

  final String name;
  final Uint8List? photo;
  final ValueChanged<Uint8List?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      children: [
        ProfileAvatar(name: name, photo: photo, size: 84),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _pick,
              icon: const Icon(Icons.photo_camera_outlined, size: 17),
              label: Text(l10n.profileEditPhoto),
            ),
            if (photo != null)
              TextButton.icon(
                onPressed: () => onChanged(null),
                icon: const Icon(Icons.delete_outline_rounded, size: 17),
                label: Text(l10n.profileRemovePhoto),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _pick() async {
    try {
      final file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        imageQuality: 70,
      );
      if (file != null) onChanged(await file.readAsBytes());
    } catch (_) {
      // The Reader closed the picker or denied access: keep the old photo.
    }
  }
}
