import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/profile_details.dart';
import '../../domain/entities/profile_rules.dart';
import '../providers/profile_providers.dart';
import 'profile_error_text.dart';
import 'profile_photo_picker.dart';
import 'profile_problem_text.dart';

/// Name, phone and photo, saved through the server. Starts from [initial].
class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({super.key, required this.initial});

  final ProfileDetails initial;

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  late final _name = TextEditingController(text: widget.initial.name);
  late final _phone = TextEditingController(text: widget.initial.phone);
  late Uint8List? _photo = widget.initial.photo;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(profileProvider.notifier)
          .save(
            ProfileDetails(name: _name.text, phone: _phone.text, photo: _photo),
          );
      messenger.showSnackBar(SnackBar(content: Text(l10n.profileSaved)));
      if (mounted) context.pop();
      return;
    } on ProfileProblem catch (problem) {
      _error = problem.message(l10n);
    } catch (_) {
      _error = l10n.commonSomethingWentWrong;
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        ProfilePhotoPicker(
          name: _name.text,
          photo: _photo,
          onChanged: (photo) => setState(() => _photo = photo),
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
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: Insets.md),
            child: ProfileErrorText(_error!),
          ),
        const SizedBox(height: Insets.xl),
        PrimaryButton(
          label: l10n.profileSaveChanges,
          isBusy: _busy,
          onPressed: _save,
        ),
      ],
    );
  }
}
