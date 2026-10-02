import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/p2p_routes.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_menu_button.dart';
import '../../domain/entities/reader_profile.dart';
import '../providers/reader_providers.dart';
import '../widgets/reader_bites.dart';
import '../widgets/reader_header.dart';
import '../widgets/reader_skeleton.dart';

/// `/readers?id=`: a Reader's public page. A private profile shows only the
/// name and Follow. Open to guests.
class ReaderPage extends ConsumerWidget {
  const ReaderPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final value = ref.watch(readerProvider(id));
    final loaded = value.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.readerTitle),
        actions: [
          if (loaded != null && !loaded.isMe)
            ReportMenuButton(
              target: ReportTarget(kind: ReportTargetKind.user, id: loaded.id),
              readerId: loaded.id,
              readerName: loaded.name,
            ),
        ],
      ),
      body: AsyncView(
        value: value,
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(readerProvider(id)),
        skeleton: const ReaderSkeleton(),
        builder: (reader) => ListView(
          padding: const EdgeInsets.all(Insets.screen),
          children: [
            ReaderHeader(reader: reader),
            if (reader.showsDetails && reader.liveListingCount > 0)
              Padding(
                padding: const EdgeInsets.only(top: Insets.md),
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.storefront_outlined),
                  label: Text(l10n.readerSeeBooks(reader.liveListingCount)),
                  onPressed: () => context.push(P2pRoutes.sellerFor(id)),
                ),
              ),
            const SizedBox(height: Insets.xl),
            if (reader.showsDetails)
              ReaderBites(readerId: id)
            else
              Text(l10n.readerPrivate, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
