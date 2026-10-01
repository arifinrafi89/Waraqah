import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

const _addressTree = <String, Map<String, List<String>>>{
  'Dhaka': {
    'Dhaka': ['Dhanmondi', 'Mirpur', 'Uttara'],
    'Gazipur': ['Gazipur Sadar', 'Tongi'],
  },
  'Chattogram': {
    'Chattogram': ['Pahartali', 'Kotwali'],
    'Cox\'s Bazar': ['Cox\'s Bazar Sadar', 'Teknaf'],
  },
  'Sylhet': {
    'Sylhet': ['Sylhet Sadar', 'Beanibazar'],
    'Moulvibazar': ['Moulvibazar Sadar', 'Sreemangal'],
  },
};

class AddressDraft {
  const AddressDraft({
    required this.label,
    required this.line,
    required this.division,
    required this.district,
    required this.upazila,
  });

  final String label;
  final String line;
  final String division;
  final String district;
  final String upazila;

  String get summary => '$label · $upazila, $district, $division';
}

class AddressEditor extends StatefulWidget {
  const AddressEditor({super.key, required this.onSaved, this.initial});

  final ValueChanged<AddressDraft> onSaved;
  final AddressDraft? initial;

  @override
  State<AddressEditor> createState() => _AddressEditorState();
}

class _AddressEditorState extends State<AddressEditor> {
  final _label = TextEditingController();
  final _line = TextEditingController();
  String? _division;
  String? _district;
  String? _upazila;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    if (initial != null) {
      _label.text = initial.label;
      _line.text = initial.line;
      _division = initial.division;
      _district = initial.district;
      _upazila = initial.upazila;
    }
  }

  @override
  void dispose() {
    _label.dispose();
    _line.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final districts = _division == null
        ? const <String>[]
        : _addressTree[_division]!.keys.toList();
    final upazilas = _district == null
        ? const <String>[]
        : _addressTree[_division]![_district]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        AppTextField(
          label: l10n.profileAddressLabel,
          hint: l10n.profileAddressLabel,
          icon: Icons.bookmark_border_rounded,
          controller: _label,
        ),
        AppTextField(
          label: l10n.profileAddressLine,
          hint: l10n.profileAddressLine,
          icon: Icons.home_outlined,
          controller: _line,
        ),
        _picker(
          label: l10n.profileDivision,
          hint: l10n.profileSelectDivision,
          value: _division,
          values: _addressTree.keys.toList(),
          onChanged: (value) => setState(() {
            _division = value;
            _district = null;
            _upazila = null;
          }),
        ),
        _picker(
          label: l10n.profileDistrict,
          hint: l10n.profileSelectDistrict,
          value: _district,
          values: districts,
          onChanged: (value) => setState(() {
            _district = value;
            _upazila = null;
          }),
        ),
        _picker(
          label: l10n.profileUpazila,
          hint: l10n.profileSelectUpazila,
          value: _upazila,
          values: upazilas,
          onChanged: (value) => setState(() => _upazila = value),
        ),
        PrimaryButton(
          label: l10n.profileSaveAddress,
          onPressed: _canSave
              ? () => widget.onSaved(
                  AddressDraft(
                    label: _label.text.trim(),
                    line: _line.text.trim(),
                    division: _division!,
                    district: _district!,
                    upazila: _upazila!,
                  ),
                )
              : null,
        ),
      ],
    );
  }

  bool get _canSave =>
      _label.text.trim().isNotEmpty &&
      _line.text.trim().isNotEmpty &&
      _division != null &&
      _district != null &&
      _upazila != null;

  Widget _picker({
    required String label,
    required String hint,
    required String? value,
    required List<String> values,
    required ValueChanged<String?> onChanged,
  }) => DropdownButtonFormField<String>(
    key: ValueKey('$label:$value'),
    initialValue: value,
    isExpanded: true,
    decoration: InputDecoration(labelText: label, hintText: hint),
    items: [
      for (final item in values)
        DropdownMenuItem(value: item, child: Text(item)),
    ],
    onChanged: values.isEmpty ? null : onChanged,
  );
}
