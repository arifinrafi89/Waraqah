import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../../../admin/domain/entities/admin_section.dart';
import '../providers/book_form_provider.dart';
import '../widgets/academic_fields.dart';
import '../widgets/admin_list_skeleton.dart';
import '../widgets/book_details_fields.dart';
import '../widgets/book_form_bar.dart';
import '../widgets/cover_seed_picker.dart';
import '../widgets/edition_list_editor.dart';

/// `/admin/catalog/book?id=`: adds a Book (no id) or edits one, with its
/// Class, Exam and Subject, cover colours and Editions.
class BookFormPage extends ConsumerWidget {
  const BookFormPage({super.key, this.bookId});

  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final form = ref.watch(bookFormProvider(bookId));
    return Scaffold(
      bottomNavigationBar: form.hasValue
          ? BookFormBar(form: form.requireValue, bookId: bookId)
          : null,
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              ScreenAppBar(
                leading: Row(
                  spacing: Insets.md,
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back_rounded,
                      tooltip: MaterialLocalizations.of(context)
                          .backButtonTooltip,
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(
                              AdminRoutes.section(AdminSection.catalog),
                            ),
                    ),
                    Flexible(
                      child: Text(
                        bookId == null
                            ? l10n.adminCatalogAddBook
                            : l10n.adminCatalogEditBook,
                        style: context.texts.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AsyncView(
                  value: form,
                  skeleton: const AdminListSkeleton(),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(bookFormProvider(bookId)),
                  builder: (form) => ListView(
                    padding: const EdgeInsets.all(Insets.screen),
                    children: [
                      BookDetailsFields(form: form, bookId: bookId),
                      const SizedBox(height: Insets.md),
                      AcademicFields(form: form, bookId: bookId),
                      const SizedBox(height: Insets.xl),
                      CoverSeedPicker(
                        title: form.draft.title,
                        seed: form.draft.coverSeed,
                        onChanged: (seed) => ref
                            .read(bookFormProvider(bookId).notifier)
                            .edit((d) => d.copyWith(coverSeed: seed)),
                      ),
                      const SizedBox(height: Insets.xl),
                      EditionListEditor(form: form, bookId: bookId),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
