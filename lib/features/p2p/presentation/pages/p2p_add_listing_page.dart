import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/p2p_add_listing_notifier.dart';
import '../widgets/listing_book_step.dart';
import '../widgets/listing_condition_step.dart';
import '../widgets/listing_price_step.dart';

class P2pAddListingPage extends ConsumerStatefulWidget {
  const P2pAddListingPage({super.key});

  @override
  ConsumerState<P2pAddListingPage> createState() => _P2pAddListingPageState();
}

class _P2pAddListingPageState extends ConsumerState<P2pAddListingPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final notifier = ref.read(p2pAddListingProvider.notifier);
    final l10n = AppL10n.of(context)!;

    return Scaffold(
      backgroundColor: palette.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenAppBar(
              title: l10n.listingSellBook,
              actions: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            Expanded(
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep < 3) {
                    setState(() => _currentStep += 1);
                  } else {
                    notifier.saveAsDraft();
                    context.pop();
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() => _currentStep -= 1);
                  }
                },
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: const EdgeInsets.only(top: Insets.lg),
                    child: Row(
                      children: [
                        FilledButton(
                          onPressed: details.onStepContinue,
                          child: Text(
                            _currentStep == 3
                                ? l10n.listingSaveDraft
                                : l10n.listingNext,
                          ),
                        ),
                        if (_currentStep > 0) ...[
                          const SizedBox(width: Insets.sm),
                          TextButton(
                            onPressed: details.onStepCancel,
                            child: Text(l10n.listingBack),
                          ),
                        ],
                      ],
                    ),
                  );
                },
                steps: [
                  for (final (i, title, content) in [
                    (0, l10n.listingStepPickBook, const ListingBookStep()),
                    (
                      1,
                      l10n.listingStepCondition,
                      const ListingConditionStep(),
                    ),
                    (2, l10n.listingStepPhotos, Text(l10n.listingPhotosDesc)),
                    (
                      3,
                      l10n.listingStepPriceHandover,
                      const ListingPriceStep(),
                    ),
                  ])
                    Step(
                      title: Text(title),
                      // The Stepper centres narrow content; keep it left.
                      content: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: content,
                      ),
                      isActive: _currentStep >= i,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
