import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// The address editor's text fields: label, recipient, phone and line.
class AddressFields extends StatelessWidget {
  const AddressFields({
    super.key,
    required this.label,
    required this.recipient,
    required this.phone,
    required this.line,
  });

  final TextEditingController label;
  final TextEditingController recipient;
  final TextEditingController phone;
  final TextEditingController line;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      spacing: Insets.md,
      children: [
        AppTextField(
          label: l10n.profileAddressLabel,
          hint: l10n.profileAddressLabelHint,
          icon: Icons.bookmark_border_rounded,
          controller: label,
        ),
        AppTextField(
          label: l10n.profileRecipient,
          hint: l10n.authNameHint,
          icon: Icons.person_outline_rounded,
          controller: recipient,
        ),
        AppTextField(
          label: l10n.profilePhone,
          hint: l10n.profilePhoneHint,
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          controller: phone,
        ),
        AppTextField(
          label: l10n.profileAddressLine,
          hint: l10n.profileAddressLine,
          icon: Icons.home_outlined,
          controller: line,
        ),
      ],
    );
  }
}
