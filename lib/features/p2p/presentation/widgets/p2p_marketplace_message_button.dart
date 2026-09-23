import 'package:flutter/material.dart';

class P2pMarketplaceMessageButton extends StatelessWidget {
  const P2pMarketplaceMessageButton({
    super.key,
    required this.color,
    required this.accent,
  });

  final Color color;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: const Icon(Icons.message_outlined, size: 16),
      label: const Text('Message'),
    );
  }
}
