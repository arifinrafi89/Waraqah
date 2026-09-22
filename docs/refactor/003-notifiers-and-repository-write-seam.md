# Plan 003: Give creates a path through the repository, and replace WidgetRef-taking free functions with Notifiers

> **Executor instructions**: Follow this plan step by step. Run every
> verification command and confirm the expected result before moving to the
> next step. If anything in the "STOP conditions" section occurs, stop and
> report — do not improvise. When done, update the status row for this plan
> in `docs/refactor/README.md`.
>
> **Drift check (run first)**:
> `git diff --stat 02b95e1..HEAD -- lib test`
> This plan is written against the layout that plan 001 produces. Before
> starting, confirm plan 001 is marked DONE in `docs/refactor/README.md` and
> that `lib/features/p2p/data/p2p_providers.dart` exists. If it does not, STOP.

## Status

- **Priority**: P1
- **Effort**: M
- **Risk**: MED
- **Depends on**: `docs/refactor/001-move-shared-domain-out-of-home.md` (must be DONE)
- **Category**: tech-debt
- **Planned at**: commit `02b95e1`, 2026-09-22

## Why this matters

Every repository interface in this app is read-only — `getPosts()`,
`getListings()`, `getOrders()`, `getBooks()` — while every *write* in the app
bypasses the repository entirely and pokes a `StateProvider` directly from a
widget:

```dart
// create_post_page.dart:42
ref.read(postsProvider.notifier).update((posts) => [post, ...posts]);

// create_listing_page.dart:45-47
ref.read(p2pListingsProvider.notifier).update((listings) => [listing, ...listings]);

// order_controller.dart:14-16
void placeOrder(WidgetRef ref, Order order) {
  ref.read(ordersProvider.notifier).state = [order, ...ref.read(ordersProvider)];
}
```

`ARCHITECTURE.md` §9 states the intended data flow as
`Flutter UI -> Feature Controller -> Repository -> supabase_flutter -> Supabase`,
and `docs/adr/0001` justifies the whole dummy-data design on the promise that
swapping in Supabase "later is a data-layer swap (implementing the same
repository interface)". For reads that promise holds. For writes there is no
interface to implement: when Supabase lands, `insert` has nowhere to go, and
every create screen has to be rewritten instead of a repository class.

The cart is a sharper version of the same problem. Its mutations are top-level
functions that take a `WidgetRef`:

```dart
// cart_controller.dart:15
void addToCart(WidgetRef ref, String bookId) { ... }
```

`WidgetRef` only exists inside the widget tree, so cart logic cannot be called
from another provider, cannot be composed, and cannot be unit-tested without
pumping a widget. The repo already contains the correct pattern —
`ThemeController extends Notifier<AppThemeState>` in
`lib/core/theme/theme_controller.dart` — and nothing else follows it.

After this lands: creating a post, a listing or an order goes through a method
on a `Notifier`, which calls a method on a repository interface. That method is
the seam a Supabase implementation plugs into, and the cart is testable without
a widget.

## Current state

### What plan 001 leaves in place (verify before you start)

- `lib/features/book_bites/data/book_bites_providers.dart` — `postRepositoryProvider`, `postsProvider`
- `lib/features/p2p/data/p2p_providers.dart` — `p2pListingRepositoryProvider`, `p2pListingsProvider`
- `lib/features/orders/data/order_providers.dart` — `orderRepositoryProvider`, `ordersProvider`
- `lib/features/cart/presentation/controllers/cart_controller.dart` — untouched by 001

Each of the three `*Provider` list declarations currently looks like:

```dart
final postsProvider = StateProvider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);
```

### The repository interfaces, each a single read method

```dart
// lib/features/book_bites/domain/repositories/post_repository.dart
abstract class PostRepository {
  List<Post> getPosts();
}
```

`P2pListingRepository.getListings()`, `OrderRepository.getOrders()` and
`ProfileRepository.getProfiles()` have the identical shape.

### The dummy implementations hold their data in `static` fields

```dart
// lib/features/book_bites/data/repositories/dummy_post_repository.dart
class DummyPostRepository implements PostRepository {
  static final DateTime _now = DateTime(2026, 9, 21);

  static final List<Post> _posts = [ /* 8+ seeded posts */ ];

  @override
  List<Post> getPosts() => List.unmodifiable(_posts);
}
```

`DummyP2pListingRepository` uses `static const List<P2pListing> _listings`,
`DummyProfileRepository` uses `static const List<Profile> _profiles`, and
`DummyOrderRepository` uses `static final List<Order> _orders`.

**This `static` is load-bearing for test isolation and must change.** Today
nothing ever mutates those lists — writes land in the per-`ProviderContainer`
`StateProvider` state, so one widget test's created listing cannot leak into the
next. Once `addListing` writes into repository storage, `static` storage would
be shared by every test in the process and
`test/features/p2p/presentation/pages/create_listing_page_test.dart` would start
failing depending on execution order. Step 1 converts the seeds to instance
fields for exactly this reason.

### The cart's free-function API and its six call sites

```dart
// lib/features/cart/presentation/controllers/cart_controller.dart:15-52
void addToCart(WidgetRef ref, String bookId) { ... }
void setQuantity(WidgetRef ref, String bookId, int quantity) { ... }
void removeFromCart(WidgetRef ref, String bookId) { ... }
void clearCart(WidgetRef ref) { ... }
```

Call sites:

```
lib/features/home/presentation/pages/home_page.dart:476            addToCart(ref, book.id);
lib/features/catalog/presentation/pages/book_detail_page.dart:111  addToCart(ref, book.id);
lib/features/catalog/presentation/pages/catalog_page.dart:57       addToCart(ref, book.id);
lib/features/search/presentation/pages/search_page.dart:194        addToCart(ref, book.id);
lib/features/cart/presentation/pages/cart_page.dart:70             setQuantity(ref, item.bookId, qty)
lib/features/cart/presentation/pages/cart_page.dart:71             removeFromCart(ref, item.bookId)
lib/features/checkout/presentation/pages/checkout_page.dart:71     clearCart(ref);
lib/features/checkout/presentation/pages/checkout_page.dart:59     placeOrder(ref, Order(...));
```

### The exemplar to copy

`lib/core/theme/theme_controller.dart:72-103` — the repo's only correct
Notifier. Note the shape: class extends `Notifier<T>`, `build()` returns the
initial state, mutation methods assign to `state`, and the provider is declared
at the bottom of the same file.

```dart
class ThemeController extends Notifier<AppThemeState> {
  @override
  AppThemeState build() => _initial ?? AppThemeState.defaultState;

  Future<void> setMode(ThemeMode mode) async {
    state = state.copyWith(mode: mode);
    await _persist();
  }
}

final themeControllerProvider =
    NotifierProvider<ThemeController, AppThemeState>(ThemeController.new);
```

### Vocabulary and constraints

From `CONTEXT.md`, binding on the method names you choose:

- **Post**: the entity is `Post`; "Book-Bite" is UI-only and must not appear in
  a Dart identifier.
- **Order**: "The cart is cleared when an `Order` is created, so the two never
  share state." Keep that behavior — checkout still clears the cart after
  placing.
- **OrderStatus**: "An order is `pending` the moment it is placed; nothing in
  the app advances it." Do not add status-transition methods.
- **CartItem**: "Only primary-catalog `Book`s can become `CartItem`s — a
  `P2pListing` never does." The cart notifier takes a `bookId`, never a listing.

From `docs/adr/0001`: this is a dummy-data phase. The repository write methods
return synchronously and mutate in-memory lists. **Do not add persistence, and
do not make anything `Future`-returning in this plan** — that is plan 004's job
and mixing the two produces a diff nobody can review.

## Commands you will need

| Purpose | Command | Expected on success |
|---|---|---|
| Deps | `flutter pub get` | exit 0 |
| Analyze | `flutter analyze` | `No issues found!` |
| Tests | `flutter test` | `All tests passed!` |
| Create-flow tests | `flutter test test/features/p2p/presentation/pages/create_listing_page_test.dart test/features/book_bites/presentation/pages/create_post_page_test.dart` | all pass |
| Repeat-run isolation check | `flutter test && flutter test` | identical counts both runs |

## Scope

**In scope**:
- `lib/features/book_bites/domain/repositories/post_repository.dart`
- `lib/features/book_bites/data/repositories/dummy_post_repository.dart`
- `lib/features/book_bites/data/book_bites_providers.dart`
- `lib/features/p2p/domain/repositories/p2p_listing_repository.dart`
- `lib/features/p2p/data/repositories/dummy_p2p_listing_repository.dart`
- `lib/features/p2p/data/p2p_providers.dart`
- `lib/features/orders/domain/repositories/order_repository.dart`
- `lib/features/orders/data/repositories/dummy_order_repository.dart`
- `lib/features/orders/data/order_providers.dart`
- `lib/features/orders/presentation/controllers/order_controller.dart` (deleted — see step 5)
- `lib/features/cart/presentation/controllers/cart_controller.dart`
- The eight call sites listed above
- `lib/core/data/dummy_profile_repository.dart` (step 1 only — `static` → instance, for consistency; no write method)
- Tests listed under "Test plan"

**Out of scope** (do NOT touch):
- Making anything `async` or `Future`-returning. Plan 004.
- `BookRepository` / `DummyBookRepository` — the catalog is read-only by design
  (books come from Google Books / Open Library, per `ARCHITECTURE.md` §5); it
  gets no write method.
- `ProfileRepository` — no screen creates a profile. Leave it read-only.
- Any UI layout, widget tree or styling change. The only edits inside page files
  are the mutation call lines.
- Delete/update methods. Nothing in the app deletes a post, a listing or an
  order. Adding `deletePost()` "for symmetry" is exactly the speculative
  interface this plan exists to avoid.
- `macos/Flutter/GeneratedPluginRegistrant.swift`.

## Git workflow

- Branch: `git switch -c advisor/003-write-seam`
- Commit per step; style matches `git log`: imperative subject, blank line,
  wrapped body, then `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`
- Do NOT push and do NOT open a PR.

## Steps

### Step 1: Make dummy repository storage per-instance, not static

In each of `DummyPostRepository`, `DummyP2pListingRepository`,
`DummyOrderRepository` and `DummyProfileRepository`, convert the storage field
from `static` to an instance field seeded from a `static const` (or
`static final`, where `DateTime` arithmetic is involved) seed list. Shape:

```dart
class DummyPostRepository implements PostRepository {
  static final DateTime _now = DateTime(2026, 9, 21);

  static final List<Post> _seed = [ /* the existing entries, unchanged */ ];

  final List<Post> _posts = [..._seed];

  @override
  List<Post> getPosts() => List.unmodifiable(_posts);
}
```

Do not change a single seeded value — same ids, same titles, same dates, same
order. The repository providers are `Provider`s, so each `ProviderContainer`
constructs its own repository and each test gets fresh data.

**Verify**: `flutter test` → `All tests passed!`, count unchanged. Then
`grep -n "static" lib/features/*/data/repositories/*.dart lib/core/data/*.dart`
→ every remaining `static` is on a `_seed` or `_now` field, never on the
mutable list.

### Step 2: Add one write method per interface

```dart
// lib/features/book_bites/domain/repositories/post_repository.dart
abstract class PostRepository {
  List<Post> getPosts();

  /// Adds [post] to the newest end of the feed and returns the updated list.
  List<Post> addPost(Post post);
}
```

Identical shape for `P2pListingRepository.addListing(P2pListing listing)` and
`OrderRepository.addOrder(Order order)`. Returning the updated list is what
lets the notifier assign `state` in one line without a second read; keep that
convention across all three.

Implement in each dummy repository by matching the ordering the UI currently
produces — **newest first**, i.e. `_posts.insert(0, post)` then
`return List.unmodifiable(_posts)`. Getting this backwards is the most likely
silent regression in this plan: `create_post_page.dart:42` and
`create_listing_page.dart:45-47` both prepend today, and
`order_controller.dart:15` prepends too.

**Verify**: `flutter analyze` → `No issues found!` (the interfaces compile and
every implementation satisfies them; nothing calls the new methods yet).

### Step 3: Convert the three list providers to Notifiers

In `lib/features/book_bites/data/book_bites_providers.dart`, replace the
`StateProvider` with a `Notifier`, following `ThemeController`:

```dart
class PostsNotifier extends Notifier<List<Post>> {
  @override
  List<Post> build() => ref.watch(postRepositoryProvider).getPosts();

  void add(Post post) {
    state = ref.read(postRepositoryProvider).addPost(post);
  }
}

final postsProvider =
    NotifierProvider<PostsNotifier, List<Post>>(PostsNotifier.new);
```

**Keep the provider name `postsProvider`.** Every read site
(`ref.watch(postsProvider)`) then continues to work untouched, and the diff
stays confined to the write sites. Same for `P2pListingsNotifier` /
`p2pListingsProvider` (`addListing`) and `OrdersNotifier` / `ordersProvider`
(`place(Order order)` — named `place`, not `add`, because `CONTEXT.md` calls
the act of creating an order "placed").

**Verify**: `flutter analyze` → errors only at the write call sites listed in
"Current state" (`.update(...)` and `.state =` no longer exist on these
notifiers). That error list is your step-4 worklist.

### Step 4: Point the create screens at the new methods

- `lib/features/book_bites/presentation/pages/create_post_page.dart:42`:
  `ref.read(postsProvider.notifier).update((posts) => [post, ...posts]);`
  becomes `ref.read(postsProvider.notifier).add(post);`
- `lib/features/p2p/presentation/pages/create_listing_page.dart:45-47`:
  the `.update(...)` call becomes
  `ref.read(p2pListingsProvider.notifier).add(listing);`

Change nothing else in those files — not the form, not the validation, not the
`context.pop()`.

**Verify**:
`flutter test test/features/p2p/presentation/pages/create_listing_page_test.dart`
→ all pass, including "Submitting a listing adds it to the P2P feed".

### Step 5: Replace `placeOrder` with a notifier method

Delete `lib/features/orders/presentation/controllers/order_controller.dart`
entirely — after plan 001 it contains only the `placeOrder` free function, whose
body now belongs in `OrdersNotifier.place`.

In `lib/features/checkout/presentation/pages/checkout_page.dart`, the import of
`orders/presentation/controllers/order_controller.dart` becomes
`orders/data/order_providers.dart`, and the call at line 59 becomes:

```dart
    ref.read(ordersProvider.notifier).place(
      Order(
        // ...unchanged...
      ),
    );
```

**Verify**: `grep -rn "placeOrder" lib test` → no output.
`ls lib/features/orders/presentation/controllers/` → empty or gone.

### Step 6: Convert the cart to a Notifier

Rewrite `lib/features/cart/presentation/controllers/cart_controller.dart` so
the four free functions become methods, keeping every behavior exactly as it is
today — including that `setQuantity` with a quantity of `0` or less removes the
line rather than storing a zero:

```dart
class CartController extends Notifier<List<CartItem>> {
  /// Session-scoped cart, seeded so the badge and page are populated on first
  /// open. Not persisted; restarting the app empties the cart (ADR-0001).
  @override
  List<CartItem> build() => const [
        CartItem(bookId: 'book-1', quantity: 1),
        CartItem(bookId: 'book-2', quantity: 1),
      ];

  void add(String bookId) { /* existing addToCart body, using `state` */ }

  void setQuantity(String bookId, int quantity) { /* existing body */ }

  void remove(String bookId) { /* existing body */ }

  void clear() => state = const [];
}

final cartItemsProvider =
    NotifierProvider<CartController, List<CartItem>>(CartController.new);
```

`cartCountProvider` and `cartSubtotalProvider` are derived `Provider`s and do
not change. If plan 002 has already landed, `cartTotalProvider` does not change
either.

Then update the call sites — each drops the `ref` argument and gains
`.notifier`:

| File:line | Before | After |
|---|---|---|
| `home_page.dart:476` | `addToCart(ref, book.id);` | `ref.read(cartItemsProvider.notifier).add(book.id);` |
| `book_detail_page.dart:111` | `addToCart(ref, book.id);` | same shape |
| `catalog_page.dart:57` | `addToCart(ref, book.id);` | same shape |
| `search_page.dart:194` | `addToCart(ref, book.id);` | same shape |
| `cart_page.dart:70` | `setQuantity(ref, item.bookId, qty)` | `ref.read(cartItemsProvider.notifier).setQuantity(item.bookId, qty)` |
| `cart_page.dart:71` | `removeFromCart(ref, item.bookId)` | `ref.read(cartItemsProvider.notifier).remove(item.bookId)` |
| `checkout_page.dart:71` | `clearCart(ref);` | `ref.read(cartItemsProvider.notifier).clear();` |

Each of those files already imports the cart controller, so no import changes
are needed — confirm rather than assume.

**Verify**: `grep -rn "addToCart\|removeFromCart\|clearCart" lib test` → no
output. `flutter analyze` → `No issues found!`.

### Step 7: Fix the one test that pokes provider state directly

`test/features/checkout/presentation/pages/checkout_page_test.dart:33` sets
cart state through the raw notifier:

```dart
container.read(cartItemsProvider.notifier).state = const [];
```

`Notifier.state` is protected, so this becomes
`container.read(cartItemsProvider.notifier).clear();` — which is also a better
test, since it exercises the same method checkout uses.

**Verify**: `flutter test` → `All tests passed!`.

## Test plan

**Seam**: the router-level widget test — pump `MaterialApp.router` with
`AppRouter.router` inside a `ProviderScope`, drive the UI, assert on rendered
output. Prior art to model:
`test/features/p2p/presentation/pages/create_listing_page_test.dart`, which
already drives the full create-listing-to-feed flow this way.

Write-through is the one thing this plan makes newly observable, and it is
**not** visible from rendered output alone — the created item appears in the
feed whether or not the repository was involved, which is exactly the bug being
fixed. Reach it by injecting a *recording fake* repository at the same seam:

```dart
class _RecordingPostRepository implements PostRepository {
  final List<Post> added = [];
  final DummyPostRepository _inner = DummyPostRepository();

  @override
  List<Post> getPosts() => _inner.getPosts();

  @override
  List<Post> addPost(Post post) {
    added.add(post);
    return _inner.addPost(post);
  }
}

// ...
final repository = _RecordingPostRepository();
await tester.pumpWidget(
  ProviderScope(
    overrides: [postRepositoryProvider.overrideWithValue(repository)],
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    ),
  ),
);
```

Do **not** add `ProviderContainer` unit tests for the notifiers. They would name
the providers and methods this plan introduces and rename, which turns the test
into maintenance rather than a safety net. Everything below is reachable through
the UI.

Five new test cases:

`test/features/book_bites/presentation/pages/create_post_write_through_test.dart`

1. **Creating a Book-Bite writes through to `PostRepository`** — fill the
   compose form, submit, then assert the post's text renders at the top of the
   feed **and** that `repository.added` contains exactly one `Post` with that
   content. The second assertion is the point of the plan.

`test/features/p2p/presentation/pages/create_listing_write_through_test.dart`

2. **Creating a P2P listing writes through to `P2pListingRepository`** — same
   two-assertion shape, using a recording `P2pListingRepository`.

`test/features/checkout/presentation/pages/place_order_write_through_test.dart`

3. **Placing an order writes through to `OrderRepository`** — fill the checkout
   form, place the order, assert the order appears on `/orders`, that
   `repository.added` received exactly one `Order` with `OrderStatus.pending`,
   and that the cart is empty afterwards (`CONTEXT.md`: "The cart is cleared
   when an `Order` is created").

`test/features/cart/presentation/pages/cart_mutations_test.dart`

4. **Adding the same book twice increments rather than duplicating** — tap "Add
   to cart" twice on the same catalog card, open `/cart`, assert that book has
   one row and the stepper shows `2`.
5. **Dropping a line's quantity to zero removes it** — on `/cart`, step a
   quantity-1 line down, assert that book's row is gone and the remaining rows
   are unchanged.

Cases 4 and 5 are possible at this seam today; they are added here because this
plan rewrites the code paths behind them and nothing currently covers either.

Existing coverage that must keep passing with assertions unchanged: the full
create-listing flow in
`test/features/p2p/presentation/pages/create_listing_page_test.dart` and the
three checkout tests. The single permitted edit to an existing test is the
`.state = const []` line in `checkout_page_test.dart:33` (step 7), which becomes
a `clear()` call.

Verification: `flutter test` → `All tests passed!`, count increased by 5.

## Done criteria

ALL must hold:

- [ ] `flutter analyze` prints `No issues found!`
- [ ] `flutter test` prints `All tests passed!` with 5 more tests than before this plan
- [ ] Running `flutter test` twice in a row gives identical results (no state
      leaking through `static` repository storage)
- [ ] `grep -rn "addToCart\|removeFromCart\|clearCart\|placeOrder" lib test` → no output
- [ ] `grep -rn "WidgetRef ref" lib/features/*/presentation/controllers/` → no output
- [ ] `grep -rn "StateProvider<List<" lib` → no output
- [ ] `grep -n "addPost\|addListing\|addOrder" lib/features/book_bites/domain/repositories/post_repository.dart lib/features/p2p/domain/repositories/p2p_listing_repository.dart lib/features/orders/domain/repositories/order_repository.dart` → one match per file
- [ ] `grep -rn "Future" lib/features/*/domain/repositories/ lib/core/repositories/` → no output (nothing became async in this plan)
- [ ] `git status` shows no modified file outside the in-scope list
- [ ] Status row for plan 003 updated in `docs/refactor/README.md`

## STOP conditions

Stop and report back (do not improvise) if:

- `docs/refactor/README.md` does not mark plan 001 DONE, or
  `lib/features/p2p/data/p2p_providers.dart` does not exist.
- After step 1, any test fails, or `flutter test` run twice gives different
  results. That means seed data is still shared across containers and every
  later step would build on a broken foundation.
- A newly created post, listing or order appears at the *bottom* of its feed
  instead of the top. Fix the insert position, do not change the test.
- You find a fifth cart mutation call site not listed in the step 6 table.
  Report it — the list was built from a grep at plan time and a new one means
  the codebase drifted.
- Converting the cart appears to require changing `cartSubtotalProvider` or
  `cartCountProvider`. It does not; they read `cartItemsProvider` like any
  consumer.
- A step's verification fails twice after a reasonable fix attempt.

## Maintenance notes

- This plan creates the exact seam plan 004 widens: `addPost` / `addListing` /
  `addOrder` are what become `Future<void>` when the repositories go async, and
  the notifiers become `AsyncNotifier`s. Doing the shape change (this plan)
  before the async change (004) means every call site is edited once, not twice.
- When Supabase lands, a `SupabasePostRepository implements PostRepository` is
  the whole change for the write path. The notifier does not move and the
  screens do not change.
- A reviewer should check three things: that insert order is still newest-first
  on all three feeds, that no repository storage is `static` any more, and that
  the new write-through tests (cases 1–3) assert against the recording
  *repository*, not just the rendered feed — a test that only checks the feed
  would pass even if the repository were bypassed, which is the bug this plan
  fixes.
- Deliberately not done: the cart still has no repository. Nothing persists it
  (ADR-0001 says restarting the app empties it) and `CONTEXT.md` describes
  `cart_items` as a future Supabase table, so inventing `CartRepository` now
  would be an interface with one implementation and no caller that needs it.
  Add it when the cart actually has to survive a restart.
