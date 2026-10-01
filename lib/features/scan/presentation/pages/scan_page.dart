import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/isbn.dart';
import '../providers/scan_providers.dart';
import '../widgets/isbn_entry.dart';
import '../widgets/scan_app_bar.dart';
import '../widgets/scan_result.dart';
import '../widgets/scanner_view.dart';

/// `/scan`: one scanner to look a book up or start a used Listing with it.
/// The camera reads the barcode; the ISBN can also be typed.
class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key, this.forSell = false});

  final bool forSell;

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  String? _isbn;
  bool _invalid = false;

  void _try(String code) {
    final isbn = Isbn.normalize(code);
    if (isbn == _isbn && isbn != null) return;
    setState(() {
      _invalid = isbn == null;
      _isbn = isbn ?? _isbn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final camera = ref.watch(cameraScanSupportedProvider);
    final isbn = _isbn;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              const ScanAppBar(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    if (camera)
                      ScannerView(onCode: _try)
                    else
                      Text(
                        l10n.scanNoCamera,
                        style: AppFonts.ui(
                          size: 12.5,
                          color: context.palette.textDim,
                        ),
                      ),
                    const SizedBox(height: Insets.lg),
                    IsbnEntry(onSubmit: _try, invalid: _invalid),
                    if (isbn != null) ...[
                      const SizedBox(height: Insets.lg),
                      ScanResult(isbn: isbn, forSell: widget.forSell),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
