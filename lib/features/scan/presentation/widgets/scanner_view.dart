import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// The camera, reading the EAN-13 barcode printed on the back of a book.
/// Calls [onCode] with what it read.
class ScannerView extends StatefulWidget {
  const ScannerView({super.key, required this.onCode});

  final ValueChanged<String> onCode;

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final _controller = MobileScannerController(
    formats: const [BarcodeFormat.ean13],
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      spacing: Insets.sm,
      children: [
        // Phone-sized even on a wide screen, so the ISBN field stays in view.
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Radii.card),
              child: MobileScanner(
                controller: _controller,
                onDetect: (capture) {
                  final code = capture.barcodes.firstOrNull?.rawValue;
                  if (code != null) widget.onCode(code);
                },
                errorBuilder: (context, _) => ColoredBox(
                  color: palette.surface2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Insets.lg),
                      child: Text(
                        l10n.scanCameraError,
                        textAlign: TextAlign.center,
                        style: AppFonts.ui(size: 13, color: palette.textDim),
                      ),
                    ),
                  ),
                ),
                overlayBuilder: (context, _) => Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: palette.accent, width: 3),
                        borderRadius: BorderRadius.circular(Radii.md),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          l10n.scanAim,
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 12.5, color: palette.textDim),
        ),
      ],
    );
  }
}
