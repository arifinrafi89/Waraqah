import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../profile_routes.dart';
import '../providers/address_providers.dart';

/// "Add a new address" for other features (checkout): opens Profile's
/// address editor and reloads [addressesProvider] on return.
class AddAddressButton extends ConsumerWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SecondaryButton(
    label: AppL10n.of(context)!.profileAddNewAddress,
    icon: const Icon(Icons.add_location_alt_outlined, size: 18),
    onPressed: () async {
      await context.push(ProfileRoutes.addressesAdd);
      if (context.mounted) ref.invalidate(addressesProvider);
    },
  );
}
