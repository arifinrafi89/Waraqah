import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/saved_address.dart';
import '../providers/address_providers.dart';
import 'address_editor.dart';
import 'address_tile.dart';
import 'confirm_dialog.dart';

/// The saved addresses, then the editor when [editing] isn't `null`.
class AddressList extends ConsumerWidget {
  const AddressList({
    super.key,
    required this.addresses,
    required this.editing,
    required this.onEdit,
    required this.onSaved,
  });

  final List<SavedAddress> addresses;
  final SavedAddress? editing;
  final ValueChanged<SavedAddress> onEdit;
  final VoidCallback onSaved;

  Future<void> _act(
    BuildContext context,
    WidgetRef ref,
    SavedAddress address,
    AddressAction action,
  ) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final notifier = ref.read(addressesProvider.notifier);
    try {
      switch (action) {
        case AddressAction.edit:
          onEdit(address);
        case AddressAction.makeDefault:
          await notifier.makeDefault(address.id);
        case AddressAction.delete:
          if (!await confirmDialog(
            context,
            title: l10n.profileDeleteAddress,
            message: l10n.profileDeleteAddressMessage,
            confirm: l10n.profileDeleteAddress,
          )) {
            return;
          }
          await notifier.delete(address.id);
          messenger.showSnackBar(
            SnackBar(content: Text(l10n.profileAddressDeleted)),
          );
      }
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        if (addresses.isEmpty && editing == null)
          Text(l10n.profileNoAddresses, style: context.texts.bodyMedium),
        for (final address in addresses)
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.sm),
            child: AddressTile(
              address: address,
              onAction: (action) => _act(context, ref, address, action),
            ),
          ),
        if (editing != null) ...[
          const SizedBox(height: Insets.lg),
          AddressEditor(
            key: ValueKey(editing!.id),
            initial: editing!,
            onSaved: onSaved,
          ),
        ],
      ],
    );
  }
}
