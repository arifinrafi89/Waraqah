import 'dart:async';

import 'package:flutter/material.dart';

/// Time left until [endsAt] as HH:MM:SS, ticking every second. Shows
/// 00:00:00 once it's over.
class Countdown extends StatefulWidget {
  const Countdown({super.key, required this.endsAt, this.style});

  final DateTime endsAt;
  final TextStyle? style;

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late final Timer _tick;

  @override
  void initState() {
    super.initState();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _tick.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final left = widget.endsAt.difference(DateTime.now());
    final seconds = left.isNegative ? 0 : left.inSeconds;
    String two(int n) => n.toString().padLeft(2, '0');
    return Text(
      '${two(seconds ~/ 3600)}:${two(seconds ~/ 60 % 60)}:${two(seconds % 60)}',
      style: widget.style,
    );
  }
}
