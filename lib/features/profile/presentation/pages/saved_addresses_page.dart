import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/saved_address.dart';
import '../providers/address_providers.dart';
import '../widgets/address_list.dart';
import '../widgets/addresses_skeleton.dart';
import '../widgets/profile_page_scaffold.dart';

/// `/profile/addresses`: the saved addresses checkout delivers to. With
/// [adding] (`?add=1`, from checkout) the editor opens straight away and
/// the page closes once the address is saved.
class SavedAddressesPage extends ConsumerStatefulWidget {
  const SavedAddressesPage({super.key, this.adding = false});

  final bool adding;

  @override
  ConsumerState<SavedAddressesPage> createState() => _SavedAddressesPageState();
}

class _SavedAddressesPageState extends ConsumerState<SavedAddressesPage> {
  /// The address being edited; a blank id adds one. `null` when closed.
  SavedAddress? _editing;

  @override
  void initState() {
    super.initState();
    if (widget.adding) _editing = _blank();
  }

  SavedAddress _blank() => SavedAddress(
    label: '',
    recipient: ref.read(sessionProvider)?.name ?? '',
    phone: '',
    line: '',
    upazila: '',
    district: '',
    division: '',
  );

  void _saved() {
    final l10n = AppL10n.of(context)!;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.profileAddressSaved)));
    if (widget.adding && context.canPop()) {
      context.pop();
    } else {
      setState(() => _editing = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ProfilePageScaffold(
      title: l10n.profileSavedAddresses,
      actions: [
        IconButton(
          tooltip: l10n.profileAddAddress,
          icon: Icon(
            _editing == null ? Icons.add_rounded : Icons.close_rounded,
          ),
          onPressed: () =>
              setState(() => _editing = _editing == null ? _blank() : null),
        ),
      ],
      body: AsyncView(
        value: ref.watch(addressesProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(addressesProvider),
        skeleton: const AddressesSkeleton(),
        builder: (addresses) => AddressList(
          addresses: addresses,
          editing: _editing,
          onEdit: (address) => setState(() => _editing = address),
          onSaved: _saved,
        ),
      ),
    );
  }
}
