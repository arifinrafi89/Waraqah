import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_add_listing_notifier.dart';
import '../widgets/p2p_add_listing_field.dart';

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
    final draft = ref.watch(p2pAddListingProvider);
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
                  Step(
                    title: Text(l10n.listingStepPickBook),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        P2pAddListingField(
                          label: l10n.listingBookTitle,
                          hint: l10n.listingBookTitleHint,
                          onChanged: notifier.updateTitle,
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                  ),
                  Step(
                    title: Text(l10n.listingStepCondition),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          children: BookCondition.values.map((condition) {
                            final label = switch (condition) {
                              BookCondition.likeNew =>
                                l10n.listingConditionLikeNew,
                              BookCondition.veryGood =>
                                l10n.listingConditionVeryGood,
                              BookCondition.good => l10n.listingConditionGood,
                              BookCondition.acceptable =>
                                l10n.listingConditionAcceptable,
                            };
                            return ChoiceChip(
                              label: Text(label),
                              selected: draft.condition == condition,
                              onSelected: (_) =>
                                  notifier.updateCondition(condition),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: Insets.md),
                        Text(l10n.listingFlags),
                        Wrap(
                          spacing: 8,
                          children:
                              [
                                l10n.listingFlagHighlighting,
                                l10n.listingFlagNotes,
                                l10n.listingFlagDamage,
                              ].map((flag) {
                                return FilterChip(
                                  label: Text(flag),
                                  selected: draft.flags.contains(flag),
                                  onSelected: (_) => notifier.toggleFlag(flag),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 1,
                  ),
                  Step(
                    title: Text(l10n.listingStepPhotos),
                    content: Text(l10n.listingPhotosDesc),
                    isActive: _currentStep >= 2,
                  ),
                  Step(
                    title: Text(l10n.listingStepPriceHandover),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        P2pAddListingField(
                          label: l10n.listingPrice,
                          hint: l10n.listingPriceHint,
                          onChanged: (val) =>
                              notifier.updatePrice(int.tryParse(val) ?? 0),
                        ),
                        SwitchListTile(
                          title: Text(l10n.listingNegotiable),
                          value: draft.isNegotiable,
                          onChanged: notifier.setNegotiable,
                        ),
                        const SizedBox(height: Insets.md),
                        Text(l10n.listingHandoverMethod),
                        _HandoverOption(
                          label: l10n.listingHandoverMeet,
                          selected:
                              draft.handover == HandoverMethod.meetInPerson,
                          onTap: () =>
                              notifier.setHandover(HandoverMethod.meetInPerson),
                        ),
                        _HandoverOption(
                          label: l10n.listingHandoverDelivery,
                          selected: draft.handover == HandoverMethod.delivery,
                          onTap: () =>
                              notifier.setHandover(HandoverMethod.delivery),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 3,
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

class _HandoverOption extends StatelessWidget {
  const _HandoverOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? palette.accent : palette.textFaint,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
