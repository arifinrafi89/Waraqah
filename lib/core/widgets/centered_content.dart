import 'package:flutter/material.dart';

/// Caps content at a comfortable reading width on desktop; a no-op on phone.
/// Used by Cart, Checkout, Orders, Search and AI chat.
class CenteredContent extends StatelessWidget {
  const CenteredContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: child,
      ),
    );
  }
}
