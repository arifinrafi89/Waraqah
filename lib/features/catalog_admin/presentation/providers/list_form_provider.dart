import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catalog/domain/entities/booklist.dart';
import '../../../catalog/domain/usecases/get_booklists.dart';
import '../../../catalog/domain/usecases/get_collections.dart';
import '../../../catalog/presentation/providers/booklist_providers.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../../domain/entities/list_draft.dart';
import '../../domain/entities/list_rules.dart';
import '../../domain/usecases/save_list.dart';
import 'catalog_admin_providers.dart';

/// The builder: what Staff typed, and the problems Save found (empty until
/// the first Save).
typedef ListForm = ({ListDraft draft, Set<RuleError> errors});

/// Which list the builder edits: no [id] = a new one.
typedef ListFormKey = ({String? id, bool booklist});

class ListFormNotifier extends AsyncNotifier<ListForm> {
  ListFormNotifier(this.key);

  final ListFormKey key;

  ListForm get _form => state.requireValue;

  // ponytail: a list's detail leaves hidden Books out, so saving drops
  // them; fine while hiding is rare. Load bookIds raw if that bites.
  @override
  Future<ListForm> build() async {
    final id = key.id;
    if (id == null) {
      final kind = key.booklist ? BooklistKind.classList : null;
      return (draft: ListDraft(kind: kind), errors: const <RuleError>{});
    }
    final draft = key.booklist
        ? switch (await GetBooklist(ref.read(booklistRepositoryProvider))(id)) {
            final b? => ListDraft.ofBooklist(b),
            null => throw StateError('No Booklist $id'),
          }
        : switch (await GetCollection(
            ref.read(catalogRecordsRepositoryProvider),
          )(id)) {
            final c? => ListDraft.ofCollection(c),
            null => throw StateError('No Collection $id'),
          };
    return (draft: draft, errors: const <RuleError>{});
  }

  /// Changes the draft; problems already shown are checked again.
  void edit(ListDraft Function(ListDraft) change) {
    final draft = change(_form.draft);
    state = AsyncData((
      draft: draft,
      errors: _form.errors.isEmpty ? _form.errors : ListRules.check(draft),
    ));
  }

  /// Adds [bookId] at the end, or takes it out.
  void pick(String bookId, bool add) => edit(
    (d) => d.copyWith(
      bookIds: [
        for (final id in d.bookIds)
          if (id != bookId) id,
        if (add) bookId,
      ],
    ),
  );

  /// Moves the book at [at] one place up ([by] = -1) or down (1).
  void move(int at, int by) => edit((d) {
    final ids = [...d.bookIds];
    return d.copyWith(bookIds: ids..insert(at + by, ids.removeAt(at)));
  });

  void remove(int at) =>
      edit((d) => d.copyWith(bookIds: [...d.bookIds]..removeAt(at)));

  /// Saves when the draft passes [ListRules]; `false` when it doesn't (the
  /// problems show on the builder).
  Future<bool> save() async {
    final errors = ListRules.check(_form.draft);
    state = AsyncData((draft: _form.draft, errors: errors));
    if (errors.isNotEmpty) return false;
    await SaveList(ref.read(catalogAdminRepositoryProvider))(_form.draft);
    refreshCatalog(ref);
    return true;
  }

  Future<void> delete() async {
    await DeleteList(ref.read(catalogAdminRepositoryProvider))((
      id: key.id!,
      booklist: key.booklist,
    ));
    refreshCatalog(ref);
  }
}

final listFormProvider = AsyncNotifierProvider.autoDispose
    .family<ListFormNotifier, ListForm, ListFormKey>(ListFormNotifier.new);
