import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/address_rules.dart';
import '../../domain/entities/saved_address.dart';
import '../providers/address_providers.dart';
import 'address_fields.dart';
import 'address_problem_text.dart';
import 'profile_error_text.dart';
import 'geo_pickers.dart';

/// Adds or edits one address (an empty [initial] id adds), saved through
/// the server. Calls [onSaved] once it's saved.
class AddressEditor extends ConsumerStatefulWidget {
  const AddressEditor({
    super.key,
    required this.initial,
    required this.onSaved,
  });

  final SavedAddress initial;
  final VoidCallback onSaved;

  @override
  ConsumerState<AddressEditor> createState() => _AddressEditorState();
}

class _AddressEditorState extends ConsumerState<AddressEditor> {
  late final _label = TextEditingController(text: widget.initial.label);
  late final _recipient = TextEditingController(text: widget.initial.recipient);
  late final _phone = TextEditingController(text: widget.initial.phone);
  late final _line = TextEditingController(text: widget.initial.line);
  late GeoPick _place = (
    division: widget.initial.division,
    district: widget.initial.district,
    upazila: widget.initial.upazila,
  );
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_label, _recipient, _phone, _line]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = AppL10n.of(context)!;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(addressesProvider.notifier)
          .save(
            widget.initial.copyWith(
              label: _label.text,
              recipient: _recipient.text,
              phone: _phone.text,
              line: _line.text,
              division: _place.division,
              district: _place.district,
              upazila: _place.upazila,
            ),
          );
      widget.onSaved();
    } on AddressProblem catch (problem) {
      _error = problem.message(l10n);
    } catch (_) {
      _error = l10n.commonSomethingWentWrong;
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        AddressFields(
          label: _label,
          recipient: _recipient,
          phone: _phone,
          line: _line,
        ),
        GeoPickers(
          value: _place,
          onChanged: (place) => setState(() => _place = place),
        ),
        if (_error != null) ProfileErrorText(_error!),
        PrimaryButton(
          label: l10n.profileSaveAddress,
          isBusy: _busy,
          onPressed: _save,
        ),
      ],
    );
  }
}
