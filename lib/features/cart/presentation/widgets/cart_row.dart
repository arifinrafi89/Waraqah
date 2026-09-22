import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/money.dart';

/// One cart line item: cover, title/author/price, quantity stepper, delete.
class CartRow extends StatelessWidget {
  const CartRow({
    super.key,
    required this.book,
    required this.chip,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  final Book book;
  final Color chip;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 52,
              height: 72,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [chip, Color.lerp(chip, palette.bg, 0.45)!],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: palette.text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11.5, color: palette.textFaint),
                ),
                const SizedBox(height: 6),
                Text(
                  taka(book.price),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: palette.accent,
                  ),
                ),
                const SizedBox(height: 8),
                _QuantityStepper(
                  quantity: quantity,
                  onChanged: onQuantityChanged,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline_rounded, color: palette.textFaint),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({required this.quantity, required this.onChanged});

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(
            icon: Icons.remove_rounded,
            onTap: () => onChanged(quantity - 1),
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: palette.text,
              ),
            ),
          ),
          _StepperButton(
            icon: Icons.add_rounded,
            onTap: () => onChanged(quantity + 1),
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 16, color: palette.textDim),
      ),
    );
  }
}
