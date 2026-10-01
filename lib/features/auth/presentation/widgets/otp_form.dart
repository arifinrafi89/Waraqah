import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
    required this.contact,
    required this.onSubmit,
    this.isBusy = false,
    this.errorText,
  });

  final String contact;
  final ValueChanged<String> onSubmit;
  final bool isBusy;
  final String? errorText;

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _otp = TextEditingController();

  @override
  void dispose() {
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, Insets.screen, 20, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 13,
        children: [
          Text(
            l10n.authOtpMessage(widget.contact),
            style: AppFonts.ui(size: 13, color: context.palette.textDim),
          ),
          AppTextField(
            label: l10n.authVerifyOtp,
            hint: l10n.authOtpHint,
            icon: Icons.pin_outlined,
            keyboardType: TextInputType.number,
            controller: _otp,
          ),
          Text(
            l10n.authOtpDemoNote,
            style: AppFonts.ui(size: 11, color: context.palette.textFaint),
          ),
          if (widget.errorText != null)
            Text(
              widget.errorText!,
              style: AppFonts.ui(
                size: 12,
                weight: FontWeight.w700,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          PrimaryButton(
            label: l10n.authVerifyOtp,
            isBusy: widget.isBusy,
            onPressed: () => widget.onSubmit(_otp.text),
          ),
        ],
      ),
    );
  }
}
