import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';

Future<String?> showBiteComposer(BuildContext context) {
  final controller = TextEditingController();
  return showModalBottomSheet<String>(
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.lg,
        Insets.screen,
        MediaQuery.viewInsetsOf(context).bottom + Insets.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: AppL10n.of(context)!.bitesComposerHint,
            ),
          ),
          const SizedBox(height: Insets.md),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: Text(AppL10n.of(context)!.bitesPost),
          ),
        ],
      ),
    ),
  ).whenComplete(controller.dispose);
}
