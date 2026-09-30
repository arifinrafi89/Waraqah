import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_line.dart';
import 'cart_line_tile.dart';

/// The cart's lines. When it holds both new and used books they come in two
/// groups, "New" then "Used", since they ship and return differently.
class CartLinesList extends StatelessWidget {
  const CartLinesList({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final fresh = [
      for (final line in cart.lines)
        if (!line.kind.isUsed) line,
    ];
    final used = [
      for (final line in cart.lines)
        if (line.kind.isUsed) line,
    ];
    final grouped = fresh.isNotEmpty && used.isNotEmpty;
    Widget heading(String text) => Padding(
      padding: const EdgeInsets.only(bottom: Insets.sm),
      child: Text(text, style: context.texts.titleMedium),
    );
    Widget tile(CartLine line) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CartLineTile(key: ValueKey(line.id), line: line),
    );
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        if (grouped) heading(l10n.cartNewBooks),
        ...fresh.map(tile),
        if (grouped) heading(l10n.cartUsedBooks),
        ...used.map(tile),
        const SizedBox(height: Insets.sm),
        Text(
          l10n.cartDeliveryNote,
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 11, color: palette.textFaint),
        ),
      ],
    );
  }
}
