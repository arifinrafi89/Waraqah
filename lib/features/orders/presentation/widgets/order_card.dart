import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/money.dart';
import '../../domain/models/order.dart';

const _maxThumbnails = 4;

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final itemCount = order.items.fold(0, (sum, item) => sum + item.quantity);
    final shown = order.items.take(_maxThumbnails).toList();
    final extra = order.items.length - shown.length;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.id,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: palette.text,
                ),
              ),
              _StatusPill(status: order.status, palette: palette),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            _formatDate(order.placedAt),
            style: TextStyle(fontSize: 11.5, color: palette.textDim),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                for (var i = 0; i < shown.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 0 : 24),
                    child: _Thumbnail(
                      chip: palette.chips[i % palette.chips.length],
                      palette: palette,
                    ),
                  ),
                if (extra > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: _ExtraBubble(count: extra, palette: palette),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$itemCount items',
                style: TextStyle(fontSize: 12.5, color: palette.textDim),
              ),
              Text(
                taka(order.total),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: palette.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime date) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.chip, required this.palette});

  final Color chip;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [chip, Color.lerp(chip, palette.bg, 0.45)!],
          ),
          border: Border.all(color: palette.surface, width: 2),
        ),
      ),
    );
  }
}

class _ExtraBubble extends StatelessWidget {
  const _ExtraBubble({required this.count, required this.palette});

  final int count;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: palette.surface2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: palette.surface, width: 2),
      ),
      child: Text(
        '+$count',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: palette.textDim,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status, required this.palette});

  final OrderStatus status;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    final String label;
    switch (status) {
      case OrderStatus.pending:
        bg = palette.surface2;
        fg = palette.textDim;
        label = 'Pending';
      case OrderStatus.shipped:
        bg = palette.accentSoft;
        fg = palette.accent;
        label = 'Shipped';
      case OrderStatus.delivered:
        bg = palette.accent;
        fg = palette.accentInk;
        label = 'Delivered';
      case OrderStatus.cancelled:
        bg = palette.surface2;
        fg = palette.textFaint;
        label = 'Cancelled';
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: fg),
      ),
    );
  }
}
