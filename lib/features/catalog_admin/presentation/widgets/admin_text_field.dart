import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';

/// A labelled field for the admin forms, with its rule error underneath.
/// [number] takes digits only; [multiline] grows with the text.
class AdminTextField extends StatelessWidget {
  const AdminTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.error,
    this.number = false,
    this.multiline = false,
  });

  final String label;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? error;
  final bool number;
  final bool multiline;

  @override
  Widget build(BuildContext context) => TextFormField(
    initialValue: initialValue,
    onChanged: onChanged,
    keyboardType: number ? TextInputType.number : null,
    minLines: multiline ? 2 : null,
    maxLines: multiline ? null : 1,
    inputFormatters: number ? [FilteringTextInputFormatter.digitsOnly] : null,
    style: context.texts.bodyMedium?.copyWith(color: context.palette.text),
    decoration: adminInputDecoration(context, label, error: error),
  );
}

/// The admin forms' outlined field look, shared with dropdowns and pickers.
InputDecoration adminInputDecoration(
  BuildContext context,
  String label, {
  String? error,
}) => InputDecoration(
  labelText: label,
  errorText: error,
  errorMaxLines: 3,
  isDense: true,
  filled: true,
  fillColor: context.palette.surface,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(Radii.md)),
);
