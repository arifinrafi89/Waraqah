# Plan 001: Move Post, Profile and P2pListing out of `features/home` into their owning modules

> **Executor instructions**: Follow this plan step by step. Run every
> verification command and confirm the expected result before moving to the
> next step. If anything in the "STOP conditions" section occurs, stop and
> report — do not improvise. When done, update the status row for this plan
> in `docs/refactor/README.md`.
>
> **Drift check (run first)**:
> `git diff --stat 02b95e1..HEAD -- lib/features lib/core test`
> If any in-scope file changed since this plan was written, compare the
> "Current state" excerpts against the live code before proceeding; on a
> mismatch, treat it as a STOP condition.

## Status

- **Priority**: P1
- **Effort**: M
- **Risk**: LOW
- **Depends on**: none
- **Category**: tech-debt
- **Planned at**: commit `02b95e1`, 2026-09-22

## Why this matters

`CLAUDE.md` and `ARCHITECTURE.md` §3 describe a feature-based "LEGO"
architecture: each module under `lib/features/<name>/` is self-contained, and
anything shared across features lives in `lib/core/`. The `home` feature
currently violates both halves of that rule. It owns the `Post`, `Profile` and
`P2pListing` domain models, their repository interfaces, their dummy
implementations, and the Riverpod providers that expose them — yet `home` is
only a *consumer* of all three (it renders a Book-Bites strip and a P2P strip on
the dashboard). The real owners are `book_bites`, `profile` and `p2p`.

The concrete cost: 19 import statements in `p2p`, `book_bites` and `profile`
reach into `features/home/`, and seven of them reach specifically into
`home/presentation/controllers/home_controller.dart` — a *presentation-layer*
file — to get their data. Deleting or rewriting `home` today breaks three other
features. A new contributor looking for the P2P listing model will not find it
under `features/p2p/`.

A second, related defect is fixed here: repository wiring is declared in the
presentation layer. `postRepositoryProvider`, `profileRepositoryProvider` and
`p2pListingRepositoryProvider` are declared inside `home_controller.dart`, and
`orderRepositoryProvider` inside `order_controller.dart`. The repo already has
the correct pattern for this — `lib/core/providers/book_providers.dart` — and
this plan makes every feature match it.

After this lands: every domain model lives in the module that owns it, no
feature imports another feature's `presentation/` directory, and the `home`
feature can be edited without touching three other modules.

## Current state

### The files that move

- `lib/features/home/domain/models/post.dart` — the `Post` model. Owner should
  be `book_bites`.
- `lib/features/home/domain/models/p2p_listing.dart` — `P2pListing`,
  `P2pCondition`, `P2pStatus`. Owner should be `p2p`.
- `lib/features/home/domain/models/profile.dart` — `Profile`. Used by `home`,
  `p2p`, `book_bites` and `profile`, so owner should be `lib/core/`.
- `lib/features/home/domain/repositories/{post,p2p_listing,profile}_repository.dart`
  — the three abstract interfaces, each a single method.
- `lib/features/home/data/repositories/dummy_{post,p2p_listing,profile}_repository.dart`
  — the three dummy implementations.

### The provider declarations that move

`lib/features/home/presentation/controllers/home_controller.dart` today, in
full:

```dart
// lib/features/home/presentation/controllers/home_controller.dart:15-48
final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => DummyProfileRepository());

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

final homeBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final homeBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

final postsProvider = StateProvider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);

final profilesProvider = Provider<List<Profile>>(
  (ref) => ref.watch(profileRepositoryProvider).getProfiles(),
);

final p2pListingsProvider = StateProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pListingRepositoryProvider).getListings(),
);

/// New Books grid, filtered and sorted by the active selections.
final filteredBooksProvider = Provider<List<Book>>((ref) {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = ref.watch(booksProvider);
  return sortBooks(filterBooks(books, filter), sort);
});
```

Only the last three declarations (`homeBookFilterProvider`,
`homeBookSortProvider`, `filteredBooksProvider`) are genuinely home's own.

`lib/features/orders/presentation/controllers/order_controller.dart:7-16`:

```dart
final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

final ordersProvider = StateProvider<List<Order>>(
  (ref) => ref.watch(orderRepositoryProvider).getOrders(),
);

void placeOrder(WidgetRef ref, Order order) {
  ref.read(ordersProvider.notifier).state = [order, ...ref.read(ordersProvider)];
}
```

### The exemplar to copy

`lib/core/providers/book_providers.dart` is the pattern every new providers
file in this plan must follow — repository provider first, then the providers
derived from it:

```dart
// lib/core/providers/book_providers.dart:13-18
final bookRepositoryProvider =
    Provider<BookRepository>((ref) => DummyBookRepository());

final booksProvider = Provider<List<Book>>(
  (ref) => ref.watch(bookRepositoryProvider).getBooks(),
);
```

Note the matching directory split in `lib/core/`: `models/`, `repositories/`
(interfaces), `data/` (implementations), `providers/` (Riverpod wiring).

### The 19 imports that must be rewritten

```
lib/features/p2p/presentation/controllers/p2p_controller.dart:3      ../../../home/domain/models/p2p_listing.dart
lib/features/p2p/presentation/controllers/p2p_controller.dart:4      ../../../home/presentation/controllers/home_controller.dart
lib/features/p2p/presentation/widgets/p2p_grid_card.dart:7           ../../../home/domain/models/p2p_listing.dart
lib/features/p2p/presentation/widgets/p2p_grid_card.dart:8           ../../../home/domain/models/profile.dart
lib/features/p2p/presentation/widgets/p2p_condition_chip_row.dart:5  ../../../home/domain/models/p2p_listing.dart
lib/features/p2p/presentation/pages/p2p_page.dart:8                  ../../../home/presentation/controllers/home_controller.dart
lib/features/p2p/presentation/pages/p2p_detail_page.dart:7           ../../../home/presentation/controllers/home_controller.dart
lib/features/p2p/presentation/pages/create_listing_page.dart:7       ../../../home/domain/models/p2p_listing.dart
lib/features/p2p/presentation/pages/create_listing_page.dart:8       ../../../home/presentation/controllers/home_controller.dart
lib/features/book_bites/presentation/pages/book_bites_page.dart:7    ../../../home/presentation/controllers/home_controller.dart
lib/features/book_bites/presentation/pages/create_post_page.dart:7   ../../../home/presentation/controllers/home_controller.dart
lib/features/book_bites/presentation/pages/create_post_page.dart:8   ../../../home/domain/models/post.dart
lib/features/book_bites/presentation/widgets/post_card.dart:5        ../../../home/domain/models/post.dart
lib/features/book_bites/presentation/widgets/post_card.dart:6        ../../../home/domain/models/profile.dart
lib/features/profile/presentation/controllers/profile_controller.dart:3  ../../../home/domain/models/p2p_listing.dart
lib/features/profile/presentation/controllers/profile_controller.dart:4  ../../../home/domain/models/profile.dart
lib/features/profile/presentation/controllers/profile_controller.dart:5  ../../../home/presentation/controllers/home_controller.dart
lib/features/profile/presentation/pages/profile_page.dart:8          ../../../home/domain/models/profile.dart
lib/features/profile/presentation/pages/profile_page.dart:9          ../../../home/presentation/controllers/home_controller.dart
```

Plus `lib/features/home/presentation/pages/home_page.dart:16-19`, which imports
the three models and `../controllers/home_controller.dart` relatively, and two
test files listed under "Test plan".

### The current-user constant, defined in three places

```dart
// lib/features/profile/presentation/controllers/profile_controller.dart:7
const currentProfileId = 'profile-1';

// lib/features/book_bites/presentation/pages/create_post_page.dart:20
  static const _currentUserId = 'profile-1';

// lib/features/p2p/presentation/pages/create_listing_page.dart:21
  static const _currentUserId = 'profile-1';
```

Since `Profile` becomes a core concept in this plan, the single shared
definition moves to core along with it.

### Vocabulary this plan must honor

Quoted from `CONTEXT.md` — the executor has not read it, and these names are
binding:

- **Post**: "The domain/data-layer name for a Book-Bite... _Avoid_: BookBite
  class name — 'Book-Bite' is the UI-facing label only; the underlying entity
  is `Post`, mirroring the `posts` table." So the file stays `post.dart` and
  the class stays `Post` even though it now lives under `book_bites/`.
- **P2pListing**: "_Avoid_: Listing (ambiguous with future primary-marketplace
  listings)." Do not rename to `Listing` while moving it.
- **Profile**: "The app-facing user record extending Supabase `auth.users`...
  _Avoid_: User (reserve for the auth-layer concept once auth exists)."

`docs/adr/0001-dummy-data-mirrors-supabase-schema.md` requires that these
models keep their exact field names (they mirror the planned Supabase tables).
**This plan moves files and rewrites imports. It changes no class name, no
field name, and no behavior.**

## Commands you will need

| Purpose | Command | Expected on success |
|---|---|---|
| Deps | `flutter pub get` | exit 0 |
| Analyze | `flutter analyze` | `No issues found!` |
| Tests | `flutter test` | `All tests passed!` (56 tests today) |
| Single test | `flutter test test/features/p2p/presentation/pages/p2p_page_test.dart` | all pass |

## Scope

**In scope** (create, move or modify only these):

Core (new files):
- `lib/core/models/profile.dart` (moved)
- `lib/core/repositories/profile_repository.dart` (moved)
- `lib/core/data/dummy_profile_repository.dart` (moved)
- `lib/core/providers/profile_providers.dart` (new)

p2p (new files):
- `lib/features/p2p/domain/models/p2p_listing.dart` (moved)
- `lib/features/p2p/domain/repositories/p2p_listing_repository.dart` (moved)
- `lib/features/p2p/data/repositories/dummy_p2p_listing_repository.dart` (moved)
- `lib/features/p2p/data/p2p_providers.dart` (new)

book_bites (new files):
- `lib/features/book_bites/domain/models/post.dart` (moved)
- `lib/features/book_bites/domain/repositories/post_repository.dart` (moved)
- `lib/features/book_bites/data/repositories/dummy_post_repository.dart` (moved)
- `lib/features/book_bites/data/book_bites_providers.dart` (new)

orders (new file):
- `lib/features/orders/data/order_providers.dart` (new)

Deleted after the move:
- `lib/features/home/domain/` (entire directory)
- `lib/features/home/data/` (entire directory)

Modified:
- `lib/features/home/presentation/controllers/home_controller.dart`
- `lib/features/home/presentation/pages/home_page.dart` (imports only)
- `lib/features/orders/presentation/controllers/order_controller.dart`
- the 10 files listed in "The 19 imports that must be rewritten"
- test files listed in "Test plan"

**Out of scope** (do NOT touch, even though they look related):
- `lib/core/models/book.dart`, `lib/core/data/dummy_book_repository.dart`,
  `lib/core/providers/book_providers.dart` — `Book` is already correctly placed;
  moving or reshaping it is a different job.
- Any change to a model's fields, a repository method signature, or a provider's
  *type*. `postsProvider` stays a `StateProvider<List<Post>>`; converting it to
  a `Notifier` is plan 003's job and doing it here makes this diff unreviewable.
- Any widget's build method, layout, styling or behavior.
- `lib/features/cart/`, `lib/features/checkout/`, `lib/features/search/`,
  `lib/features/catalog/`, `lib/features/auth/`.
- `macos/Flutter/GeneratedPluginRegistrant.swift` — already modified in the
  working tree before you started; leave it exactly as is.

## Git workflow

- Branch off the current branch: `git switch -c advisor/001-move-shared-domain`
  (the repo's working branch is `frontend-setup`; the default branch is `main`).
- Commit style, matching `git log`: short imperative subject, blank line,
  wrapped body explaining *why*, then the trailer. Example from the repo:

  ```
  Extract shared AppBottomNav + BookGridCard widgets

  <body>

  Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
  ```
- One commit per step is fine. Do NOT push and do NOT open a PR.

## Steps

### Step 1: Move `Profile` to core

Use `git mv` so history is preserved:

```
git mv lib/features/home/domain/models/profile.dart lib/core/models/profile.dart
git mv lib/features/home/domain/repositories/profile_repository.dart lib/core/repositories/profile_repository.dart
git mv lib/features/home/data/repositories/dummy_profile_repository.dart lib/core/data/dummy_profile_repository.dart
```

Then fix the relative imports inside the two moved non-model files so they
resolve from their new location. After the move they must read:

```dart
// lib/core/repositories/profile_repository.dart
import '../models/profile.dart';

// lib/core/data/dummy_profile_repository.dart
import '../models/profile.dart';
import '../repositories/profile_repository.dart';
```

`lib/core/models/profile.dart` has no imports and needs no edit.

**Verify**: `flutter analyze` → errors are expected at this point (the old
import paths in other files are now broken). Confirm that *none* of the errors
are inside the three files you just moved.

### Step 2: Create `lib/core/providers/profile_providers.dart`

Model it exactly on `lib/core/providers/book_providers.dart`. It holds the two
profile providers moved out of `home_controller.dart`, plus the current-user
constant and provider moved out of `profile_controller.dart`:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_profile_repository.dart';
import '../models/profile.dart';
import '../repositories/profile_repository.dart';

final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => DummyProfileRepository());

final profilesProvider = Provider<List<Profile>>(
  (ref) => ref.watch(profileRepositoryProvider).getProfiles(),
);

/// The demo current user. There is no auth yet (ADR-0001); every feature that
/// needs "who am I" resolves it from here so there is one place to replace
/// when Supabase Auth lands.
const currentProfileId = 'profile-1';

final currentProfileProvider = Provider<Profile>((ref) {
  return ref
      .watch(profilesProvider)
      .firstWhere((profile) => profile.id == currentProfileId);
});
```

**Verify**: `flutter analyze 2>&1 | grep "core/providers/profile_providers"` →
no output (no errors in the new file).

### Step 3: Move the p2p domain into the p2p feature

```
mkdir -p lib/features/p2p/domain/models lib/features/p2p/domain/repositories lib/features/p2p/data/repositories
git mv lib/features/home/domain/models/p2p_listing.dart lib/features/p2p/domain/models/p2p_listing.dart
git mv lib/features/home/domain/repositories/p2p_listing_repository.dart lib/features/p2p/domain/repositories/p2p_listing_repository.dart
git mv lib/features/home/data/repositories/dummy_p2p_listing_repository.dart lib/features/p2p/data/repositories/dummy_p2p_listing_repository.dart
```

The relative imports inside the two moved non-model files are unchanged by this
move (the directory depth is identical), so they should still read
`../models/p2p_listing.dart` and `../../domain/...`. Confirm rather than assume.

Then create `lib/features/p2p/data/p2p_providers.dart`:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/p2p_listing.dart';
import '../domain/repositories/p2p_listing_repository.dart';
import 'repositories/dummy_p2p_listing_repository.dart';

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

final p2pListingsProvider = StateProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pListingRepositoryProvider).getListings(),
);
```

**Verify**: `flutter analyze 2>&1 | grep "features/p2p/data\|features/p2p/domain"`
→ no output.

### Step 4: Move the post domain into the book_bites feature

```
mkdir -p lib/features/book_bites/domain/models lib/features/book_bites/domain/repositories lib/features/book_bites/data/repositories
git mv lib/features/home/domain/models/post.dart lib/features/book_bites/domain/models/post.dart
git mv lib/features/home/domain/repositories/post_repository.dart lib/features/book_bites/domain/repositories/post_repository.dart
git mv lib/features/home/data/repositories/dummy_post_repository.dart lib/features/book_bites/data/repositories/dummy_post_repository.dart
```

Then create `lib/features/book_bites/data/book_bites_providers.dart`, exactly
parallel to step 3:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/post.dart';
import '../domain/repositories/post_repository.dart';
import 'repositories/dummy_post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

final postsProvider = StateProvider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);
```

**Verify**: `ls lib/features/home/domain lib/features/home/data` → both
directories are now empty or gone. Remove them if empty:
`rmdir -p lib/features/home/domain/models lib/features/home/domain/repositories lib/features/home/data/repositories 2>/dev/null; true`

### Step 5: Shrink `home_controller.dart` to home's own state

It must end up containing only the three home-owned declarations, with the
three cross-feature provider blocks deleted:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';

final homeBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final homeBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

/// New Books grid, filtered and sorted by the active selections.
final filteredBooksProvider = Provider<List<Book>>((ref) {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = ref.watch(booksProvider);
  return sortBooks(filterBooks(books, filter), sort);
});
```

**Verify**: `grep -c "RepositoryProvider" lib/features/home/presentation/controllers/home_controller.dart`
→ `0`.

### Step 6: Move the orders repository wiring out of presentation

Create `lib/features/orders/data/order_providers.dart`:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import 'repositories/dummy_order_repository.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

final ordersProvider = StateProvider<List<Order>>(
  (ref) => ref.watch(orderRepositoryProvider).getOrders(),
);
```

`lib/features/orders/presentation/controllers/order_controller.dart` keeps only
the mutation helper, now importing the providers:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/order_providers.dart';
import '../../domain/models/order.dart';

void placeOrder(WidgetRef ref, Order order) {
  ref.read(ordersProvider.notifier).state = [order, ...ref.read(ordersProvider)];
}
```

Leave `placeOrder` as a free function taking `WidgetRef` for now — converting it
is plan 003's job.

**Verify**: `grep -rn "ordersProvider\|orderRepositoryProvider" lib | grep -v "data/order_providers.dart"`
→ only `order_controller.dart`, `orders_page.dart` and `checkout_page.dart`
appear, as *consumers*.

### Step 7: Rewrite every import in the consuming features

Work through the 19-import list in "Current state". The rewrite rules are
mechanical:

| Old import | New import |
|---|---|
| `home/domain/models/profile.dart` | `<n>/core/models/profile.dart` |
| `home/domain/models/post.dart` | `<n>/book_bites/domain/models/post.dart` |
| `home/domain/models/p2p_listing.dart` | `<n>/p2p/domain/models/p2p_listing.dart` |
| `home_controller.dart` for `profilesProvider` / `currentProfileProvider` | `<n>/core/providers/profile_providers.dart` |
| `home_controller.dart` for `postsProvider` | `<n>/book_bites/data/book_bites_providers.dart` |
| `home_controller.dart` for `p2pListingsProvider` | `<n>/p2p/data/p2p_providers.dart` |

`<n>` is the correct number of `../` hops from the importing file. From
`lib/features/<f>/presentation/pages/x.dart`, core is `../../../../core/...`
and a sibling feature is `../../../<other>/...`.

Some files import `home_controller.dart` once but need two of the new files —
for example `lib/features/profile/presentation/controllers/profile_controller.dart`
uses both `profilesProvider` and `p2pListingsProvider`, so it gets two imports.
Its final form:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/profile.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../p2p/data/p2p_providers.dart';
import '../../../p2p/domain/models/p2p_listing.dart';

/// The current user's own listings, unfiltered by status — unlike the public
/// P2P feed, reserved/sold listings still show here.
final myListingsProvider = Provider<List<P2pListing>>((ref) {
  final profile = ref.watch(currentProfileProvider);
  return ref
      .watch(p2pListingsProvider)
      .where((listing) => listing.sellerId == profile.id)
      .toList();
});
```

Note `currentProfileId` and `currentProfileProvider` are **deleted** from this
file — they now live in `lib/core/providers/profile_providers.dart` (step 2).
Any file that imported them from `profile_controller.dart` must import core
instead. Find them with:
`grep -rn "currentProfileProvider\|currentProfileId" lib test`

Also update `lib/features/home/presentation/pages/home_page.dart:16-19`, whose
three model imports and controller import all change.

The directional rule to apply when you are unsure which way an import should
point: **a feature may import another feature's `domain/` and `data/`; no
feature may import another feature's `presentation/`.** `home` and `profile`
are composition surfaces and import from `p2p` / `book_bites`; never the
reverse.

**Verify**:
```
grep -rn "home/domain\|home/data\|home/presentation/controllers" lib
```
→ no output.

### Step 8: Replace the duplicated current-user constants

In `lib/features/book_bites/presentation/pages/create_post_page.dart` delete
`static const _currentUserId = 'profile-1';` (line 20) and use the core
constant instead — add `import '../../../../core/providers/profile_providers.dart';`
and change `authorId: _currentUserId` to `authorId: currentProfileId`.

Do the same in
`lib/features/p2p/presentation/pages/create_listing_page.dart` (line 21,
`sellerId: _currentUserId` becomes `sellerId: currentProfileId`).

**Verify**: `grep -rn "_currentUserId" lib` → no output.

### Step 9: Move and split the repository tests

`test/` mirrors `lib/`, so the tests follow their subjects. Split
`test/features/home/data/dummy_repositories_test.dart` — which today covers
four repositories in four `group(...)` blocks — into three files, moving each
`group` verbatim:

- `test/core/data/dummy_repositories_test.dart` — the `DummyBookRepository` and
  `DummyProfileRepository` groups (both subjects now live in core).
- `test/features/p2p/data/dummy_p2p_listing_repository_test.dart` — the
  `DummyP2pListingRepository` group.
- `test/features/book_bites/data/dummy_post_repository_test.dart` — the
  `DummyPostRepository` group.

Each file needs only the imports its groups use, all via `package:waraqah/...`
(the existing test file's style). Delete the original file and the now-empty
`test/features/home/data/` directory.

Also fix `test/features/p2p/presentation/pages/create_listing_page_test.dart:7`,
which imports `package:waraqah/features/home/domain/models/p2p_listing.dart` and
must become `package:waraqah/features/p2p/domain/models/p2p_listing.dart`.

**Verify**: `flutter test` → `All tests passed!`, same test count as before
(56). `grep -rn "features/home" test` → no output.

### Step 10: Update the architecture docs to describe the new layout

Three documents describe the structure this plan just changed, and a stale
architecture doc is worse than none.

In `ARCHITECTURE.md` §4 "Project Structure", the `core/` listing currently shows
`network/ storage/ theme/ widgets/ services/ utils/`. Update it to reflect what
actually exists now: `data/ models/ providers/ repositories/ theme/ utils/
widgets/`. Add one sentence after the structure block:

> Domain models shared by more than one feature (`Book`, `Profile`) live in
> `core/`; a model owned by a single feature (`Post`, `P2pListing`, `Order`,
> `CartItem`) lives in that feature's `domain/`. A feature may import another
> feature's `domain/` and `data/`, never its `presentation/`.

In `CLAUDE.md`, under "## Architecture", update the "Feature modules" line — it
currently claims `cart` and `checkout` are "not yet built", which is false
(both exist and are routed), and `orders` and `search` are missing from the
list entirely. Correct it to: `auth`, `home`, `catalog`, `p2p`, `book_bites`,
`profile`, `cart`, `checkout`, `orders`, `search` implemented (UI, dummy data);
`ai_assistant` not yet built.

Add a new ADR at `docs/adr/0003-feature-owns-its-domain.md` recording this
decision. Match the style of the existing ADRs — read
`docs/adr/0002-shell-route-for-bottom-nav.md` first: a `#` title stating the
decision, a `Status: accepted` line, then two or three paragraphs of prose
covering what was there before, what changed, and the trade-off accepted. The
trade-off to record here: `home` and `profile` now import from `p2p` and
`book_bites`, so those two features are no longer importable in total isolation
— accepted because the dependency now points from consumer to owner instead of
the reverse.

**Verify**: `ls docs/adr/0003-feature-owns-its-domain.md` → file exists.

## Test plan

This is a pure move: **no new test cases are needed and no assertion should
change.** The existing 56 tests are the regression net, and they are load-bearing
here — `test/features/p2p/presentation/pages/create_listing_page_test.dart`
exercises the full create-listing-to-feed path through the providers this plan
relocates, and `test/features/home/presentation/pages/home_page_test.dart`
renders the dashboard that consumes all three domains.

Files touched (imports and locations only):
- `test/features/home/data/dummy_repositories_test.dart` → split into three
  files per step 9.
- `test/features/p2p/presentation/pages/create_listing_page_test.dart` → one
  import path.

Verification: `flutter test` → `All tests passed!` with the count unchanged at
56.

## Done criteria

ALL must hold:

- [ ] `flutter analyze` prints `No issues found!`
- [ ] `flutter test` prints `All tests passed!` with 56 tests
- [ ] `grep -rn "home/domain\|home/data" lib test` → no output
- [ ] `grep -rn "\.\./\.\./\.\./[a-z_]*/presentation" lib/features` → no output (a cross-feature import always starts `../../../<feature>/`, so this catches any feature reaching into another feature's presentation layer)
- [ ] `grep -c "RepositoryProvider" lib/features/home/presentation/controllers/home_controller.dart` → `0`
- [ ] `grep -rn "_currentUserId" lib` → no output
- [ ] `ls lib/features/home` → only `presentation` remains
- [ ] `docs/adr/0003-feature-owns-its-domain.md` exists; `ARCHITECTURE.md` §4 and `CLAUDE.md` updated
- [ ] `git status` shows no modified file outside the in-scope list (in
      particular `macos/Flutter/GeneratedPluginRegistrant.swift` is untouched by you)
- [ ] Status row for plan 001 updated in `docs/refactor/README.md`

## STOP conditions

Stop and report back (do not improvise) if:

- The code at the locations in "Current state" does not match the excerpts —
  the codebase has drifted since this plan was written.
- `flutter test` fails on a test that was passing before you started, and the
  cause is not an import path you can see and fix. In particular, if
  `create_listing_page_test.dart`'s "Submitting a listing adds it to the P2P
  feed" test fails, do not "fix" it by changing its assertions — that test
  passing is the evidence that the provider move preserved behavior.
- You find yourself needing to change a model field, a repository method
  signature, or a provider's type to make something compile. That is a signal
  the move is wrong, not that the model is wrong.
- A file outside the in-scope list needs editing.
- You discover a feature imports `home/presentation/` for something that is
  genuinely home's own UI state (not one of the three domains) — report it
  rather than inventing a home for it.

## Maintenance notes

- Plans 003 and 004 build directly on this layout: 003 converts
  `postsProvider`, `p2pListingsProvider`, `ordersProvider` and the cart into
  `Notifier` classes with write methods, and 004 makes the repository
  interfaces async. Both assume each provider sits next to the repository it
  reads, which is what this plan establishes.
- A reviewer should scrutinize exactly two things: that `git log --follow` still
  tracks each moved file (i.e. `git mv` was used, not delete-and-create), and
  that the diff contains no change to a model field or a widget's build method.
  Everything else here is import churn.
- When Supabase Auth lands, `currentProfileId` in
  `lib/core/providers/profile_providers.dart` is the single seam to replace with
  a real session lookup. That is deliberate and is why the constant was
  consolidated here.
- Deferred on purpose: `home_page.dart` is 641 lines and contains private
  `_BiteCard` and `_P2pCard` widgets that duplicate parts of
  `book_bites/presentation/widgets/post_card.dart` and
  `p2p/presentation/widgets/p2p_grid_card.dart`. Deduplicating them is real work
  with real layout risk (the home strip variants are visually different), and
  mixing it into an import-only move would hide it. Worth a separate plan.
