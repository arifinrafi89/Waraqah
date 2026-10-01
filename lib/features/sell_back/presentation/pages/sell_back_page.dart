import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sell_back.dart';
import '../../sell_back_routes.dart';
import '../providers/sell_back_providers.dart';
import '../widgets/sell_back_app_bar.dart';
import '../widgets/sell_back_book_search.dart';
import '../widgets/sell_back_form.dart';

/// `/sell-back`: pick the book, say its condition, see Waraqah's price
/// straight away, and book a pickup. `?bookId=` starts with a Book.
class SellBackPage extends ConsumerStatefulWidget {
  const SellBackPage({super.key, this.bookId});

  final String? bookId;

  @override
  ConsumerState<SellBackPage> createState() => _SellBackPageState();
}

class _SellBackPageState extends ConsumerState<SellBackPage> {
  SellBackBook? _picked;
  bool _cleared = false;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final start = widget.bookId;
    final book =
        _picked ??
        (start == null || _cleared
            ? null
            : ref.watch(sellBackBookProvider(start)).value);
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SellBackAppBar(
                title: l10n.sellBackTitle,
                actions: [
                  AppIconButton(
                    icon: Icons.history_rounded,
                    tooltip: l10n.sellBackMine,
                    onPressed: () => context.push(SellBackRoutes.mine),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    Text(
                      l10n.sellBackIntro,
                      style: AppFonts.ui(
                        size: 12.5,
                        color: context.palette.textDim,
                      ),
                    ),
                    const SizedBox(height: Insets.lg),
                    if (book == null)
                      SellBackBookSearch(
                        query: _query,
                        onQuery: (q) => setState(() => _query = q),
                        onPick: (b) => setState(() => _picked = b),
                      )
                    else
                      SellBackForm(
                        // A different book starts the form again.
                        key: ValueKey(book.bookId),
                        book: book,
                        onChange: () => setState(() {
                          _picked = null;
                          _cleared = true;
                        }),
                      ),
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
