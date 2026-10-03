import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/presentation/providers/address_providers.dart';
import '../../domain/entities/donate_place_draft.dart';
import '../../donate_admin_routes.dart';
import '../providers/donate_admin_providers.dart';
import '../widgets/donate_admin_app_bar.dart';
import '../widgets/donate_skeleton.dart';
import '../widgets/place_fields.dart';
import '../widgets/place_labels.dart';
import '../widgets/place_needs_editor.dart';

/// Add a verified place, or edit one ([id]).
class DonationPlaceFormPage extends ConsumerStatefulWidget {
  const DonationPlaceFormPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<DonationPlaceFormPage> createState() => _FormState();
}

class _FormState extends ConsumerState<DonationPlaceFormPage> {
  PlaceProblem? _problem;
  bool _busy = false;

  Future<void> _save() async {
    final draft = ref.read(placeDraftProvider(widget.id)).requireValue;
    final problem = PlaceRules.check(draft);
    setState(() => _problem = problem);
    if (problem != null) return;
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    try {
      await ref.read(placeDraftProvider(widget.id).notifier).save();
      messenger.showSnackBar(SnackBar(content: Text(l10n.adminDonateSaved)));
      if (mounted) context.pop();
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final draft = placeDraftProvider(widget.id);
    // Start the district list with the place, not after it.
    ref.watch(geoProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DonateAdminAppBar(
              title: widget.id.isEmpty
                  ? l10n.adminDonateNew
                  : l10n.adminDonateEdit,
              fallback: DonateAdminRoutes.places,
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(draft),
                skeleton: const DonateSkeleton(),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(draft),
                builder: (_) => ListView(
                  padding: const EdgeInsets.all(Insets.screen),
                  children: [
                    PlaceFields(id: widget.id),
                    const SizedBox(height: Insets.lg),
                    PlaceNeedsEditor(id: widget.id),
                    const SizedBox(height: Insets.lg),
                    if (_problem case final problem?)
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.sm),
                        child: Text(
                          l10n.placeProblem(problem),
                          style: AppFonts.ui(
                            size: 13,
                            color: context.palette.danger,
                          ),
                        ),
                      ),
                    PrimaryButton(
                      label: l10n.adminDonateSave,
                      isBusy: _busy,
                      onPressed: _save,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
