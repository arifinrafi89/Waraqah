import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../providers/quote_providers.dart';

/// Renders the card behind [boundary] at 3× and shares it as a PNG.
Future<void> shareQuoteCard(
  BuildContext context,
  WidgetRef ref,
  GlobalKey boundary,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final failed = AppL10n.of(context)!.commonSomethingWentWrong;
  final share = ref.read(quoteSharerProvider);
  try {
    final render =
        boundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await render.toImage(pixelRatio: 3);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    await share(png!.buffer.asUint8List());
  } catch (_) {
    messenger.showSnackBar(SnackBar(content: Text(failed)));
  }
}
