import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../providers/catalog_admin_actions.dart';
import 'banner_look.dart';
import 'banner_target_field.dart';
import 'banner_text_fields.dart';
import 'confirm_banner_delete.dart';
import 'rule_error_labels.dart';

/// Adds a Banner, or edits or deletes one, with a live preview.
Future<void> showBannerSheet(BuildContext context, [Banner? banner]) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _BannerForm(banner),
    );

class _BannerForm extends ConsumerStatefulWidget {
  const _BannerForm(this.initial);

  final Banner? initial;

  @override
  ConsumerState<_BannerForm> createState() => _BannerFormState();
}

class _BannerFormState extends ConsumerState<_BannerForm> {
  late final _text = [
    widget.initial?.titleEn ?? '',
    widget.initial?.titleBn ?? '',
    widget.initial?.subtitleEn ?? '',
    widget.initial?.subtitleBn ?? '',
  ];
  late var _seed = widget.initial?.seed ?? 0;
  late Season? _season = widget.initial?.season;
  late var _target =
      widget.initial?.target ?? const BannerTarget(BannerTargetKind.search, '');
  Set<RuleError> _errors = const {};

  Banner get _banner => Banner(
    id: widget.initial?.id ?? '',
    titleEn: _text[0].trim(),
    titleBn: _text[1].trim(),
    subtitleEn: _text[2].trim(),
    subtitleBn: _text[3].trim(),
    seed: _seed,
    target: _target,
    season: _season,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(
            widget.initial == null
                ? l10n.adminCatalogBannerNew
                : l10n.adminCatalogBannerEdit,
            style: context.texts.titleMedium,
          ),
          BannerTextFields(
            text: _text,
            titleError: l10n.ruleErrorOf(_errors, {RuleError.bannerTitleBlank}),
            onChanged: (i, v) => setState(() => _text[i] = v),
          ),
          BannerLook(
            banner: _banner,
            onSeed: (seed) => setState(() => _seed = seed),
            onSeason: (season) => setState(() => _season = season),
          ),
          BannerTargetField(
            target: _target,
            error: l10n.ruleErrorOf(_errors, {RuleError.bannerTargetBlank}),
            onChanged: (t) => setState(() => _target = t),
          ),
          PrimaryButton(label: l10n.adminCatalogSave, onPressed: _finish),
          if (widget.initial != null)
            SecondaryButton(
              label: l10n.adminCatalogDelete,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              onPressed: () => _finish(delete: true),
            ),
        ],
      ),
    );
  }

  /// Saves, or with [delete] deletes, then closes.
  Future<void> _finish({bool delete = false}) async {
    final actions = ref.read(catalogAdminActionsProvider);
    if (delete) {
      if (!await confirmBannerDelete(context)) return;
      await actions.deleteBanner(_banner.id);
    } else {
      setState(() => _errors = CatalogAdminRules.banner(_banner));
      if (_errors.isNotEmpty) return;
      await actions.saveBanner(_banner);
    }
    if (mounted) Navigator.pop(context);
  }
}
