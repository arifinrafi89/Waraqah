import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/profile_providers.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late final TextEditingController _name;
  late final TextEditingController _phone;
  String _photo = '';

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileDetailsProvider);
    _name = TextEditingController(text: profile.name);
    _phone = TextEditingController(text: profile.phone);
    _photo = profile.photo;
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _save() {
    if (_name.text.trim().isEmpty) return;
    ref
        .read(profileDetailsProvider.notifier)
        .update(
          name: _name.text.trim(),
          phone: _phone.text.trim(),
          photo: _photo,
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text(l10n.profileEditProfile)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [
                  _PhotoPicker(
                    photo: _photo,
                    onChanged: (value) => setState(() => _photo = value),
                  ),
                  const SizedBox(height: Insets.xl),
                  AppTextField(
                    label: l10n.profileEditName,
                    hint: l10n.authNameHint,
                    icon: Icons.person_outline_rounded,
                    controller: _name,
                  ),
                  const SizedBox(height: Insets.md),
                  AppTextField(
                    label: l10n.profilePhone,
                    hint: l10n.profilePhoneHint,
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    controller: _phone,
                  ),
                  const SizedBox(height: Insets.xl),
                  PrimaryButton(
                    label: l10n.profileSaveChanges,
                    onPressed: _save,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoPicker extends StatelessWidget {
  const _PhotoPicker({required this.photo, required this.onChanged});

  final String photo;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return Column(
      children: [
        CircleAvatar(
          radius: 42,
          backgroundColor: palette.accent,
          child: Icon(Icons.person_rounded, size: 42, color: palette.accentInk),
        ),
        TextButton.icon(
          onPressed: () => onChanged(photo.isEmpty ? 'selected' : ''),
          icon: const Icon(Icons.photo_camera_outlined, size: 17),
          label: Text(l10n.profileEditPhoto),
        ),
      ],
    );
  }
}
