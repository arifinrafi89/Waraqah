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
import '../providers/list_form_provider.dart';
import '../widgets/admin_list_skeleton.dart';
import '../widgets/list_books_editor.dart';
import '../widgets/list_form_bar.dart';
import '../widgets/list_form_fields.dart';

/// `/admin/catalog/collection?id=&list=booklist`: the builder for a
/// Collection (an Expert Pick when it has an Expert) or, with
/// `list=booklist`, a Staff Booklist. No id = a new one.
class CollectionFormPage extends ConsumerWidget {
  const CollectionFormPage({super.key, this.id, this.booklist = false});

  final String? id;
  final bool booklist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final key = (id: id, booklist: booklist);
    final form = ref.watch(listFormProvider(key));
    final title = switch ((booklist, id == null)) {
      (false, true) => l10n.adminCatalogNewCollection,
      (false, false) => l10n.adminCatalogEditCollection,
      (true, true) => l10n.adminCatalogNewBooklist,
      (true, false) => l10n.adminCatalogEditBooklist,
    };
    return Scaffold(
      bottomNavigationBar: form.hasValue ? ListFormBar(formKey: key) : null,
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
                      child: Text(title, style: context.texts.titleLarge),
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
                  onRetry: () => ref.invalidate(listFormProvider(key)),
                  builder: (form) => ListView(
                    padding: const EdgeInsets.all(Insets.screen),
                    children: [
                      ListFormFields(form: form, formKey: key),
                      const SizedBox(height: Insets.xl),
                      ListBooksEditor(form: form, formKey: key),
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
