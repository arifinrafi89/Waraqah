import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/p2p_providers.dart';

/// Searches the marketplace by title, seller or area. Starts with the
/// query another page set (e.g. "See copies" on a book request).
class P2pMarketplaceSearchField extends ConsumerStatefulWidget {
  const P2pMarketplaceSearchField({super.key});

  @override
  ConsumerState<P2pMarketplaceSearchField> createState() => _FieldState();
}

class _FieldState extends ConsumerState<P2pMarketplaceSearchField> {
  late final _query = TextEditingController(text: ref.read(p2pQueryProvider));

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(p2pQueryProvider, (_, next) {
      if (next != _query.text) _query.text = next;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: AppTextField(
        hint: AppL10n.of(context)!.usedSearchHint,
        icon: Icons.search_rounded,
        radius: 18,
        controller: _query,
        onChanged: ref.read(p2pQueryProvider.notifier).select,
      ),
    );
  }
}
