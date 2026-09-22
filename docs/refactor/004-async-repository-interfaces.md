# Plan 004: Make repository interfaces async so the Supabase swap is a data-layer change

> **Executor instructions**: Follow this plan step by step. Run every
> verification command and confirm the expected result before moving to the
> next step. If anything in the "STOP conditions" section occurs, stop and
> report — do not improvise. When done, update the status row for this plan
> in `docs/refactor/README.md`.
>
> **Drift check (run first)**:
> `git diff --stat 02b95e1..HEAD -- lib test`
> This plan is written against the layout plans 001 and 003 produce. Before
> starting, confirm both are marked DONE in `docs/refactor/README.md`, that
> `lib/features/p2p/data/p2p_providers.dart` exists, and that
> `grep -rn "StateProvider<List<" lib` returns nothing. If any of those fail,
> STOP.
>
> **This is the largest plan in the set.** Read it end to end before editing
> anything.

## Status

- **Priority**: P2
- **Effort**: L
- **Risk**: MED
- **Depends on**: `001-move-shared-domain-out-of-home.md`, `003-notifiers-and-repository-write-seam.md` (both DONE)
- **Category**: migration
- **Planned at**: commit `02b95e1`, 2026-09-22

## Why this matters

`docs/adr/0001` commits the project to this bet: build the whole frontend on
dummy data now, because "wiring up the real Supabase client later is a
data-layer swap (implementing the same repository interface) rather than a
domain-model rewrite." The models honor that bet. The interfaces do not:

```dart
// lib/core/repositories/book_repository.dart
abstract class BookRepository {
  List<Book> getBooks();
}
```

`supabase_flutter` returns futures. No Supabase implementation can satisfy
`List<Book> getBooks()`. So the "data-layer swap" will in fact be: change every
interface, change every provider from `Provider<List<T>>` to something
async-aware, and add loading and error handling to roughly twenty widget read
sites — all at once, in the same change that first introduces network calls and
auth, with no way to tell a layout bug from a query bug.

The cost is not theoretical and it compounds. There are about twenty synchronous
read sites today across ten pages, and the number grows with every screen built
(`ai_assistant` is planned and not yet written). Doing the async conversion now,
against dummy repositories that cannot fail and cannot be slow, means the
Supabase change later is genuinely what ADR-0001 promises.

After this lands: every repository method returns a `Future`, every page renders
a loading and an error state, and dropping in a Supabase implementation touches
only `lib/**/data/repositories/`.

## Current state

### The interfaces (after plans 001 and 003)

```dart
// lib/core/repositories/book_repository.dart
abstract class BookRepository {
  List<Book> getBooks();
}

// lib/core/repositories/profile_repository.dart
abstract class ProfileRepository {
  List<Profile> getProfiles();
}

// lib/features/book_bites/domain/repositories/post_repository.dart
abstract class PostRepository {
  List<Post> getPosts();
  List<Post> addPost(Post post);
}

// lib/features/p2p/domain/repositories/p2p_listing_repository.dart
abstract class P2pListingRepository {
  List<P2pListing> getListings();
  List<P2pListing> addListing(P2pListing listing);
}

// lib/features/orders/domain/repositories/order_repository.dart
abstract class OrderRepository {
  List<Order> getOrders();
  List<Order> addOrder(Order order);
}
```

### The root providers

`booksProvider` and `profilesProvider` are plain `Provider`s reading their
repository. `postsProvider`, `p2pListingsProvider` and `ordersProvider` are
`NotifierProvider`s after plan 003.

### The derived providers (all synchronous `Provider`s today)

- `lib/features/home/presentation/controllers/home_controller.dart:43` — `filteredBooksProvider`
- `lib/features/catalog/presentation/controllers/catalog_controller.dart:13` — `filteredCatalogBooksProvider`
- `lib/features/search/presentation/controllers/search_controller.dart:10` — `searchResultsProvider`
- `lib/features/p2p/presentation/controllers/p2p_controller.dart:16` — `filteredP2pListingsProvider`
- `lib/features/profile/presentation/controllers/profile_controller.dart` — `myListingsProvider` (and `currentProfileProvider`, which moves to `lib/core/providers/profile_providers.dart` in plan 001)
- `lib/features/cart/presentation/controllers/cart_controller.dart:60` — `cartSubtotalProvider` (reads `booksProvider`)

### The widget read sites that need loading/error handling

```
lib/features/home/presentation/pages/home_page.dart:346, 463, 495
lib/features/catalog/presentation/pages/catalog_page.dart:21
lib/features/catalog/presentation/pages/book_detail_page.dart:18
lib/features/p2p/presentation/pages/p2p_page.dart:22-23
lib/features/p2p/presentation/pages/p2p_detail_page.dart:20, 38, 42
lib/features/p2p/presentation/pages/create_listing_page.dart:54
lib/features/book_bites/presentation/pages/book_bites_page.dart:18-20
lib/features/book_bites/presentation/pages/create_post_page.dart:49
lib/features/profile/presentation/pages/profile_page.dart:21-24
lib/features/cart/presentation/pages/cart_page.dart:24-25
lib/features/checkout/presentation/pages/checkout_page.dart:39, 82-83
lib/features/search/presentation/pages/search_page.dart:43, 91
lib/features/orders/presentation/pages/orders_page.dart:18
```

### The one genuinely awkward site

```dart
// lib/features/checkout/presentation/pages/checkout_page.dart:35-40
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: ref.read(currentProfileProvider).fullName,
    );
  }
```

`initState` cannot `ref.read` a value that has not loaded. Step 6 handles this
one explicitly; do not improvise a fix for it earlier in the plan.

### Conventions and constraints

- Shared widgets live in `lib/core/widgets/`. `centered_content.dart` is the
  exemplar for file shape: one small public widget, no other top-level
  declarations.
- Theme colors always come from
  `Theme.of(context).extension<AppPalette>()!` — never a hardcoded `Color`.
  See any page file for the one-line idiom.
- `docs/adr/0001`: dummy repositories stand in for Supabase. They must keep
  returning their data successfully — **do not add artificial delays, failures,
  or a "simulate network" flag.** A fake error path nobody can trigger is not
  coverage; the error branch gets covered by a test with an overridden
  throwing repository instead (see "Test plan").
- `ARCHITECTURE.md` §9 fixes the data flow as
  `Flutter UI -> Feature Controller -> Repository -> supabase_flutter`.

## Commands you will need

| Purpose | Command | Expected on success |
|---|---|---|
| Deps | `flutter pub get` | exit 0 |
| Analyze | `flutter analyze` | `No issues found!` |
| Tests | `flutter test` | `All tests passed!` |
| One page's tests | `flutter test test/features/home/presentation/pages/home_page_test.dart` | all pass |

## Scope

**In scope**:
- All five repository interfaces and their five dummy implementations
- All root and derived providers listed in "Current state"
- `lib/core/widgets/async_value_view.dart` (create)
- The thirteen page files listed under "widget read sites"
- The test files listed under "Test plan"

**Out of scope** (do NOT touch):
- Adding Supabase, `supabase_flutter`, any package, or any network code. This
  plan changes shapes only; `pubspec.yaml` must be untouched.
- Adding artificial latency or failure injection to dummy repositories.
- Any layout, copy or styling change to the *loaded* state of any page. A
  screen with data must render exactly as it does today.
- Pagination, caching, refresh-on-pull, or retry buttons. Not asked for, not
  needed while the data is a local list.
- `lib/core/theme/`, `lib/app/router/app_router.dart`.
- `macos/Flutter/GeneratedPluginRegistrant.swift`.

## Git workflow

- Branch: `git switch -c advisor/004-async-repositories`
- **Commit per step.** This plan leaves the build broken between steps 1 and 7;
  per-step commits are what make it bisectable if something goes wrong.
- Style matches `git log`: imperative subject, blank line, wrapped body, then
  `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`
- Do NOT push and do NOT open a PR.

## Steps

### Step 1: Add the shared async view widget first

Create `lib/core/widgets/async_value_view.dart` before touching anything else,
so every later step has somewhere to land:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_palette.dart';

/// Renders [value]'s data, or a centered spinner while it loads, or a short
/// message on error. Every page that reads repository data goes through this
/// so loading and failure look the same everywhere.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return value.when(
      data: data,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "Couldn't load this right now.",
            textAlign: TextAlign.center,
            style: TextStyle(color: palette.textDim),
          ),
        ),
      ),
    );
  }
}
```

**Verify**: `flutter analyze` → `No issues found!` (nothing uses it yet).

### Step 2: Make the five interfaces async

Every method gains a `Future` return type: `Future<List<Book>> getBooks()`,
`Future<List<Post>> getPosts()`, `Future<List<Post>> addPost(Post post)`, and so
on for all five interfaces.

Then update the five dummy implementations. They stay synchronous internally and
just wrap their return value:

```dart
  @override
  Future<List<Post>> getPosts() async => List.unmodifiable(_posts);
```

Do not change any seed data, any insert position, or any storage field.

**Verify**: `flutter analyze` → errors are expected, and every one of them must
be at a *provider* (a `Provider` body that now receives a `Future`). If an error
appears inside a dummy repository, you changed more than the return type.

### Step 3: Convert the root providers

`lib/core/providers/book_providers.dart`:

```dart
final booksProvider = FutureProvider<List<Book>>(
  (ref) => ref.watch(bookRepositoryProvider).getBooks(),
);
```

`profilesProvider` in `lib/core/providers/profile_providers.dart` becomes a
`FutureProvider` the same way, and `currentProfileProvider` becomes:

```dart
final currentProfileProvider = FutureProvider<Profile>((ref) async {
  final profiles = await ref.watch(profilesProvider.future);
  return profiles.firstWhere((profile) => profile.id == currentProfileId);
});
```

The three notifiers from plan 003 become `AsyncNotifier`s. `PostsNotifier` is
the template for all three:

```dart
class PostsNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() => ref.watch(postRepositoryProvider).getPosts();

  Future<void> add(Post post) async {
    final repository = ref.read(postRepositoryProvider);
    state = AsyncValue.data(await repository.addPost(post));
  }
}

final postsProvider =
    AsyncNotifierProvider<PostsNotifier, List<Post>>(PostsNotifier.new);
```

Keep every provider name exactly as it is. `OrdersNotifier.place` keeps its
name and becomes `Future<void>`.

The cart is **not** async: `CartController` stays a plain
`Notifier<List<CartItem>>`, because the cart is session state with no
repository behind it (plan 003's maintenance note explains why). Only
`cartSubtotalProvider`, which reads `booksProvider`, changes — see step 4.

**Verify**: `flutter analyze 2>&1 | grep -c "error"` — note the number; it
should shrink at every subsequent step.

### Step 4: Convert the derived providers

Each becomes a `FutureProvider` that awaits its source through `.future`.
`filteredBooksProvider` is the template:

```dart
final filteredBooksProvider = FutureProvider<List<Book>>((ref) async {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = await ref.watch(booksProvider.future);
  return sortBooks(filterBooks(books, filter), sort);
});
```

Apply the same shape to `filteredCatalogBooksProvider`, `searchResultsProvider`,
`filteredP2pListingsProvider`, `myListingsProvider` and `cartSubtotalProvider`
(which becomes `FutureProvider<double>`).

Two details that are easy to get wrong:

- `searchResultsProvider` returns `const []` for an empty query **before**
  touching the book list. Keep that early return first so an empty query never
  shows a spinner.
- The filter/sort `StateProvider`s (`homeBookFilterProvider` etc.) stay
  synchronous. They are UI selection state, not repository data.

**Verify**: `grep -rn "Provider<List<" lib | grep -v Future | grep -v StateProvider`
→ no output.

### Step 5: Wrap each page's body in `AsyncValueView`

Work through the thirteen page files one at a time, committing after each. The
mechanical transform, using `catalog_page.dart` as the example:

```dart
// before
final books = ref.watch(filteredCatalogBooksProvider);
return Scaffold(body: <uses books>);

// after
final books = ref.watch(filteredCatalogBooksProvider);
return Scaffold(
  body: AsyncValueView(
    value: books,
    data: (books) => <the unchanged widget tree>,
  ),
);
```

Rules for this step:

- Wrap at the narrowest point that still covers every use of the data — usually
  the `Scaffold`'s `body`, so the `AppBar` keeps rendering during load.
- Where a page reads two async providers (for example `p2p_page.dart` reads
  `filteredP2pListingsProvider` and `booksProvider`), do **not** nest two
  `AsyncValueView`s. Add a small private record-returning `FutureProvider` in
  that feature's controller that awaits both, and wrap once. Example for
  `p2p_page.dart`:

  ```dart
  final p2pFeedProvider =
      FutureProvider<({List<P2pListing> listings, Map<String, Book> books})>(
    (ref) async => (
      listings: await ref.watch(filteredP2pListingsProvider.future),
      books: {
        for (final book in await ref.watch(booksProvider.future)) book.id: book,
      },
    ),
  );
  ```

  The pages needing this: `home_page.dart` (three sections — give the
  Book-Bites strip and the P2P strip one combined provider each, in
  `home_controller.dart`), `p2p_page.dart`, `p2p_detail_page.dart`,
  `book_bites_page.dart`, `profile_page.dart`, `cart_page.dart`,
  `checkout_page.dart`.
- Do not change anything inside the `data:` builder. If a widget's tree needs
  editing to compile, you have wrapped at the wrong level.

**Verify** after each page: `flutter analyze 2>&1 | grep "<that page's filename>"`
→ no output, and that page's widget test passes.

### Step 6: Fix the checkout name prefill

`checkout_page.dart` cannot read the profile in `initState` any more. Replace
the `initState` prefill with a one-shot prefill inside the loaded branch:

```dart
  final _nameController = TextEditingController();
  bool _prefilledName = false;

  // ...inside the AsyncValueView data builder, before building the form:
  if (!_prefilledName) {
    _nameController.text = profile.fullName;
    _prefilledName = true;
  }
```

`_nameController` is now created at field-initializer time rather than in
`initState`, and `dispose()` is unchanged. The `_prefilledName` guard is what
stops a rebuild from stomping on text the user has typed — without it, every
rebuild resets the field.

**Verify**: `flutter test test/features/checkout/presentation/pages/checkout_page_test.dart`
→ all three tests pass, including "placing a valid order empties the cart and
prepends a pending order".

### Step 7: Update the tests that read providers synchronously

`test/features/checkout/presentation/pages/checkout_page_test.dart` reads
`ordersProvider` directly at lines 44, 52, 78. Those reads now return an
`AsyncValue`, so they become either
`container.read(ordersProvider).value!` or
`await container.read(ordersProvider.future)` — prefer the `.future` form in
`async` test bodies.

`test/features/home/data/...` repository tests (split across three files by plan
001) call `repo.getBooks()` and friends synchronously; each test body becomes
`async` with `await`.

Widget tests that call `pumpAndSettle` need no change — a `FutureProvider`
backed by an immediately-completing future settles within it.

**Verify**: `flutter test` → `All tests passed!`, count unchanged from before
this plan except for the new cases below.

## Test plan

New file `test/core/widgets/async_value_view_test.dart`, modeled on
`test/core/widgets/responsive_book_grid_test.dart` (the repo's existing
pure-widget test):

1. **Renders the data builder when the value has data** — pump
   `AsyncValueView<int>(value: AsyncValue.data(42), data: (v) => Text('$v'))`
   inside a `MaterialApp` with `AppTheme.lightTheme`, assert `find.text('42')`.
2. **Renders a spinner while loading** — `const AsyncValue.loading()`, assert
   `find.byType(CircularProgressIndicator)` finds one widget.
3. **Renders the error message on error** — `AsyncValue.error(Exception('x'),
   StackTrace.empty)`, assert the message text is present and the data builder
   was not called.

New file `test/features/catalog/presentation/pages/catalog_page_error_test.dart`:

4. **A failing repository shows the error state, not a crash** — pump the app
   at `/catalog` through `AppRouter.router` (the repo's standard seam, see
   `create_listing_page_test.dart`) inside a `ProviderScope` with
   `overrides: [bookRepositoryProvider.overrideWithValue(_ThrowingBookRepository())]`,
   where `_ThrowingBookRepository implements BookRepository` and every method
   throws. Assert the error copy renders and no exception reaches the test
   binding. This is the test that makes the error branch real without polluting
   the dummy repositories with fake failures.

Existing coverage that must keep passing unchanged: all thirteen existing widget
test files. They are the proof that the loaded state of every screen is
byte-identical to before — that is the whole safety argument for this plan, so
resist the urge to "adjust" an assertion. If a widget test needs its assertions
changed, that is a STOP condition, not a fix.

Verification: `flutter test` → `All tests passed!` with 4 more tests than
before this plan.

## Done criteria

ALL must hold:

- [ ] `flutter analyze` prints `No issues found!`
- [ ] `flutter test` prints `All tests passed!`
- [ ] `grep -rn "List<" lib/core/repositories/ lib/features/*/domain/repositories/ | grep -v Future` → no output (every interface method is async)
- [ ] `grep -rn "Provider<List<" lib | grep -v Future | grep -v StateProvider` → no output
- [ ] `git diff --stat 02b95e1..HEAD -- pubspec.yaml pubspec.lock` → empty (no dependency was added)
- [ ] `grep -rn "Duration\|delay\|Future.delayed" lib/core/data lib/features/*/data` → no output (no fake latency was added)
- [ ] No assertion in any pre-existing widget test was changed (only sync→async
      reads in `checkout_page_test.dart` and the repository tests)
- [ ] `git status` shows no modified file outside the in-scope list
- [ ] Status row for plan 004 updated in `docs/refactor/README.md`

## STOP conditions

Stop and report back (do not improvise) if:

- Plans 001 and 003 are not both marked DONE.
- A pre-existing widget test fails and the only way you can see to make it pass
  is to change what it asserts. That means the loaded UI changed, which this
  plan forbids.
- Wrapping a page requires editing the widget tree inside the `data:` builder.
  Report the page — it means the data is read deeper than the wrap point and
  needs a different cut.
- You reach for `.valueOrNull`, `.value!`, `?? const []` or `requireValue` in
  *production* code to dodge a loading state. Rendering "empty" while data
  loads is a silent lie to the user; report the site instead. (`.value` in
  *test* code is fine.)
- More than two pages need the combined-record-provider treatment beyond the
  seven listed in step 5.
- A step's verification fails twice after a reasonable fix attempt.

## Maintenance notes

- After this lands, adding Supabase means writing
  `SupabaseBookRepository implements BookRepository` and changing one line in
  each `*RepositoryProvider`. Nothing in `presentation/` should need to change.
  If a future Supabase change does force a widget edit, that is worth
  investigating — it means an abstraction leaked.
- `AsyncValueView`'s error copy is deliberately generic and shows no exception
  detail. When real errors exist, that is the one place to add a retry button
  and per-error messaging — one file, not thirteen.
- The combined record providers added in step 5 (one per multi-source page) are
  the natural home for pagination later. `ARCHITECTURE.md` §7.3 says the
  Book-Bites feed is paginated in the real design, and that will land in
  `book_bites`'s combined provider, not in the page.
- A reviewer should focus on exactly two questions: does every page still render
  identically once loaded (compare against a previous build), and did any
  production code paper over the loading state with `?? const []`. Everything
  else is mechanical.
- Deferred on purpose: the cart stays synchronous. It has no repository, and
  making session state async would add loading states to the cart badge for no
  benefit. Revisit only when `cart_items` becomes a real Supabase table.
