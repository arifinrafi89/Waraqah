import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/address_editor.dart';

class SavedAddressesPage extends StatefulWidget {
  const SavedAddressesPage({super.key});

  @override
  State<SavedAddressesPage> createState() => _SavedAddressesPageState();
}

class _SavedAddressesPageState extends State<SavedAddressesPage> {
  final _addresses = <AddressDraft>[
    const AddressDraft(
      label: 'Home',
      line: 'House 12, Road 5, Dhanmondi',
      division: 'Dhaka',
      district: 'Dhaka',
      upazila: 'Dhanmondi',
    ),
    const AddressDraft(
      label: 'Family home',
      line: 'Mira Bazar, Zindabazar',
      division: 'Sylhet',
      district: 'Sylhet',
      upazila: 'Sylhet Sadar',
    ),
  ];
  bool _adding = false;
  int? _editingIndex;

  void _saveAddress(AddressDraft address) {
    setState(() {
      if (_editingIndex == null) {
        _addresses.add(address);
      } else {
        _addresses[_editingIndex!] = address;
      }
      _adding = false;
      _editingIndex = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppL10n.of(context)!.profileAddressSaved)),
    );
  }

  Future<void> _deleteAddress(int index) async {
    final l10n = AppL10n.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.profileDeleteAddress),
        content: Text(l10n.profileDeleteAddressMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: Text(l10n.profileCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(l10n.profileDeleteAddress),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _addresses.removeAt(index));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.profileAddressDeleted)));
  }

  void _editAddress(int index) => setState(() {
    _editingIndex = index;
    _adding = true;
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: Text(l10n.profileSavedAddresses),
              actions: [
                IconButton(
                  tooltip: l10n.profileAddAddress,
                  icon: const Icon(Icons.add_rounded),
                  onPressed: () => setState(() => _adding = !_adding),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [
                  if (_addresses.isEmpty)
                    Text(
                      l10n.profileNoAddresses,
                      style: context.texts.bodyMedium,
                    )
                  else
                    for (var i = 0; i < _addresses.length; i++)
                      _AddressTile(
                        address: _addresses[i],
                        onEdit: () => _editAddress(i),
                        onDelete: () => _deleteAddress(i),
                      ),
                  if (_adding) ...[
                    const SizedBox(height: Insets.lg),
                    AddressEditor(
                      key: ValueKey(_editingIndex),
                      initial: _editingIndex == null
                          ? null
                          : _addresses[_editingIndex!],
                      onSaved: _saveAddress,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  final AddressDraft address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: Insets.sm),
    child: SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(Icons.location_on_outlined, color: context.palette.accent),
          Expanded(
            child: Text(address.summary, style: context.texts.bodyMedium),
          ),
          PopupMenuButton<String>(
            tooltip: AppL10n.of(context)!.profileEditAddress,
            onSelected: (action) {
              if (action == 'edit') onEdit();
              if (action == 'delete') onDelete();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(AppL10n.of(context)!.profileEditAddress),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(AppL10n.of(context)!.profileDeleteAddress),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
