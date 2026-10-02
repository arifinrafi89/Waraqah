import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../profile/domain/entities/saved_address.dart';
import '../../../profile/presentation/widgets/add_address_button.dart';
import '../providers/checkout_providers.dart';
import 'choice_tile.dart';

/// Step 1: pick one of the reader's saved addresses (the default starts
/// picked), or add a new one in Profile.
class AddressPicker extends ConsumerWidget {
  const AddressPicker({super.key, required this.addresses});

  final List<SavedAddress> addresses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosen = ref.watch(chosenAddressProvider);
    return Column(
      spacing: Insets.sm,
      children: [
        for (final address in addresses)
          ChoiceTile(
            key: ValueKey(address.id),
            icon: Icons.location_on_outlined,
            title: address.label,
            subtitle:
                '${address.recipient} · ${address.phone}\n${address.oneLine}',
            isSelected: address.id == chosen?.id,
            onTap: () =>
                ref.read(chosenAddressIdProvider.notifier).select(address.id),
          ),
        const AddAddressButton(),
      ],
    );
  }
}
