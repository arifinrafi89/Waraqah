import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';

class P2pAddListingPage extends StatelessWidget {
  const P2pAddListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Scaffold(
      backgroundColor: palette.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenAppBar(
              title: 'Sell a Book',
              actions: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Insets.screen, 0, Insets.screen, Insets.xl),
                children: [
                  Container(
                    height: 172,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [palette.accentSoft, palette.surface2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: palette.surface,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.add_photo_alternate_outlined, size: 34),
                          ),
                          const SizedBox(height: Insets.sm),
                          Text('Add front cover', style: Theme.of(context).textTheme.labelLarge),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Insets.xl),
                  const _Field(label: 'Book title', hint: 'The Pragmatic Programmer'),
                  const _Field(label: 'Author', hint: 'David Thomas'),
                  const _Field(label: 'Price (৳)', hint: '450'),
                  const _ConditionSelector(),
                  const _Field(label: 'Seller note', hint: 'Minimal markings, original copy'),
                  const SizedBox(height: Insets.lg),
                  FilledButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.check_rounded),
                    label: const Text('Publish listing'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
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

class _Field extends StatelessWidget {
  const _Field({required this.label, required this.hint});

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: Insets.sm),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConditionSelector extends StatelessWidget {
  const _ConditionSelector();

  @override
  Widget build(BuildContext context) {
    final options = ['Like New', 'Good', 'Fair'];

    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Condition', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: Insets.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in options)
                ChoiceChip(
                  label: Text(option),
                  selected: option == 'Like New',
                  onSelected: (_) {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
