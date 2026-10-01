import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../domain/entities/book_draft.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/usecases/get_admin_book.dart';
import '../../domain/usecases/save_book.dart';
import '../../domain/usecases/set_book_hidden.dart';
import 'catalog_admin_providers.dart';

/// The Book form: what Staff typed, whether the Book is hidden, and the
/// problems Save found (empty until the first Save).
typedef BookForm = ({BookDraft draft, bool hidden, Set<RuleError> errors});

/// One Book's form. `null` id = a new Book.
class BookFormNotifier extends AsyncNotifier<BookForm> {
  BookFormNotifier(this.bookId);

  final String? bookId;

  static const _none = <RuleError>{};
  static const BookForm _empty = (
    draft: BookDraft(),
    hidden: false,
    errors: _none,
  );

  BookForm get _form => state.requireValue;

  void _set({BookDraft? draft, bool? hidden, Set<RuleError>? errors}) =>
      state = AsyncData((
        draft: draft ?? _form.draft,
        hidden: hidden ?? _form.hidden,
        errors: errors ?? _form.errors,
      ));

  @override
  Future<BookForm> build() async {
    if (bookId == null) return _empty;
    final book = await GetAdminBook(ref.read(bookRepositoryProvider))(bookId!);
    if (book == null) throw StateError('No Book $bookId');
    return (draft: BookDraft.of(book), hidden: book.hidden, errors: _none);
  }

  /// Changes the draft. A new Section clears a Category from another one.
  /// Problems already shown are checked again as Staff fix them.
  Future<void> edit(BookDraft Function(BookDraft) change) async {
    var draft = change(_form.draft);
    if (draft.section != _form.draft.section) {
      draft = draft.copyWith(categoryId: '');
    }
    _set(draft: draft);
    if (_form.errors.isNotEmpty) await _check();
  }

  /// Puts [edition] at [at], or adds it.
  Future<void> putEdition(Edition edition, {int? at}) => edit(
    (d) => d.copyWith(
      editions: [
        for (final (i, e) in d.editions.indexed) i == at ? edition : e,
        if (at == null) edition,
      ],
    ),
  );

  Future<void> removeEdition(int at) =>
      edit((d) => d.copyWith(editions: [...d.editions]..removeAt(at)));

  /// Saves when the form passes [CatalogAdminRules]; `null` when it
  /// doesn't (the problems show on the form).
  Future<Book?> save() async {
    if ((await _check()).isNotEmpty) return null;
    final book = await SaveBook(ref.read(catalogAdminRepositoryProvider))(
      _form.draft,
    );
    refreshCatalog(ref);
    return book;
  }

  Future<void> setHidden(bool hidden) async {
    final book = await SetBookHidden(ref.read(catalogAdminRepositoryProvider))((
      bookId!,
      hidden,
    ));
    _set(hidden: book.hidden);
    refreshCatalog(ref);
  }

  Future<Set<RuleError>> _check() async {
    final draft = _form.draft;
    final categories = await ref.read(
      adminRecordsProvider(RecordKind.category).future,
    );
    final category = categories.where((c) => c.id == draft.categoryId);
    final errors = CatalogAdminRules.book(
      draft,
      categorySection: category.firstOrNull?.section,
    );
    _set(errors: errors);
    return errors;
  }
}

final bookFormProvider = AsyncNotifierProvider.autoDispose
    .family<BookFormNotifier, BookForm, String?>(BookFormNotifier.new);
