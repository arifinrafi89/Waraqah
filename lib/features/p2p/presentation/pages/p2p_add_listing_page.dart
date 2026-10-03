import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/listing_rules.dart';
import '../providers/p2p_add_listing_notifier.dart';
import '../widgets/listing_form_controls.dart';
import '../widgets/listing_steps.dart';
import '../widgets/p2p_labels.dart';

/// Sell a used book: the Book, condition, photos, then price and
/// handover. Saves a draft, or sends it to the Moderation Center. The same
/// form edits a draft or a Listing a moderator sent back.
class P2pAddListingPage extends ConsumerStatefulWidget {
  const P2pAddListingPage({super.key});

  @override
  ConsumerState<P2pAddListingPage> createState() => _P2pAddListingPageState();
}

class _P2pAddListingPageState extends ConsumerState<P2pAddListingPage> {
  static const int _lastStep = 3;
  int _step = 0;
  bool _busy = false;
  ListingProblem? _problem;

  void _goTo(int step) => setState(() {
    _step = step;
    _problem = null;
  });

  Future<void> _save({required bool submit}) async {
    final problem = ListingRules.check(
      ref.read(p2pAddListingProvider),
      submit: submit,
    );
    setState(() {
      _problem = problem;
      if (problem != null) _step = problem.step;
    });
    if (problem != null) return;
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    try {
      await ref.read(p2pAddListingProvider.notifier).save(submit: submit);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            submit ? l10n.listingSentForReview : l10n.listingDraftSaved,
          ),
        ),
      );
      if (mounted) context.pop();
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.listingSaveFailed)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final editing = ref.watch(
      p2pAddListingProvider.select((l) => l.id.isNotEmpty),
    );
    return Scaffold(
      backgroundColor: context.palette.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenAppBar(
              title: editing ? l10n.listingEditTitle : l10n.listingSellBook,
              actions: [
                IconButton(
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            Expanded(
              child: Stepper(
                currentStep: _step,
                onStepTapped: _goTo,
                onStepContinue: () => _goTo(_step + 1),
                onStepCancel: () => _goTo(_step - 1),
                controlsBuilder: (context, details) => ListingFormControls(
                  last: details.stepIndex == _lastStep,
                  busy: _busy,
                  // Every step builds its controls; only the open one says.
                  problem: details.isActive ? _problem : null,
                  onNext: details.onStepContinue,
                  onBack: _step > 0 ? details.onStepCancel : null,
                  onDraft: () => _save(submit: false),
                  onSend: () => _save(submit: true),
                ),
                steps: listingSteps(l10n, _step),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
