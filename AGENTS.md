# Waraqah — Project Context for Coding Agents

Read this before writing any code in this repo. It describes what Waraqah is, how the code is organised, the rules every change must follow, and who owns what.

This file is **not committed** to the repo (the team keeps AI context files out of `main`). Keep it at the repo root on your machine.

---

## 1. What Waraqah is

Waraqah is a **book store app for Bangladesh**, like Rokomari, with two connected marketplaces:

- **First-hand (new books):** Waraqah runs its own store. **Staff** add books, set prices and manage stock. Readers buy with bKash, Nagad, cash on delivery or card.
- **Second-hand (used books):** Readers list their own used books. **Every listing is approved by a moderator** before it goes live. Buyers and sellers chat, make offers, and meet in person or let Waraqah handle the sale.

**The core idea is a circular book economy:** buy a book new → read it → sell it back to Waraqah or list it for another reader → someone buys it used. Most of the features that make Waraqah special connect the two marketplaces.

**It is for every reader, not only students.** Academic is one of eight **Sections**: Academic, Religious, Literature, Admission & Job Prep, School & College, Non-fiction, Skills & Tech, Children.

The app also has:
- **Book-Bites:** a short-post social feed about books (like Twitter), with optional book tags and spoiler tags
- **AI Reading Assistant:** recommends books from Waraqah's own catalog
- **Reading life:** shelves, reading progress and stats

### Product decisions (don't reverse these without the team)

| Decision | Meaning for code |
|---|---|
| **Self-run store** | No vendor comparison anywhere (no "Rokomari vs Wafilife"). A Book's price comes from its own **Editions**. |
| **No Beneficial / Non-Beneficial label** | Religious books get curated **collections** and **Expert Picks** with a "why read this" note instead. Ayah of the Day is an optional home module. |
| **For every reader** | No university, department or course fields in the profile. Course lists are just one kind of **Booklist**. |
| **Bites use likes only** | No downvotes. Bad content is handled by reporting. |
| **One Moderation Center** | Listing approvals, all reports (Bites, comments, reviews, listings, users, messages) and disputes live in one admin section, with one strike system and one audit log. |
| **Bites** | 500 characters max; share = system share sheet / link; comments have one level of replies. |
| **"Request a book"** | One feature: goes to admins as demand *and* notifies used-book sellers. |
| **One barcode scanner** | Used both to look up a book and to start a used listing. |

---

## 2. Current status

- **Setup steps 1–6 are done:** Book model with Editions, per-feature routes and fake APIs, login state and roles, the Admin area shell.
- **Setup step 7** (Moderation Center shell) is in progress (Arifin).
- **Browsing pages are done** (Rahinur, #87): Section, Category, Author, Publisher and Series pages, inside the Catalog tab so the bottom nav stays. Routes are in `CatalogRoutes` (`sectionFor`, `categoryFor`, `authorFor`, `publisherFor`, `seriesFor`); pages in `features/catalog/presentation/pages/`; fixtures in `features/catalog/data/sources/` (`*_fixtures.dart`, `seed/`).
- **Search is done** (Rahinur, #99): `/catalog/search` (`CatalogRoutes.search`, `search_page.dart`). Live search by title, Author, Publisher or ISBN; filters (Section, price, format, language, rating, in stock); sort (relevance, price, newest, bestselling); recent searches kept on the device. Every catalog query goes through `BookRepository.searchCatalog(CatalogFilters)` (`domain/entities/catalog_filters.dart`); state in `search_providers.dart` and `recent_searches_provider.dart`. No results shows "Request this book".
- **Home feed is done** (Rahinur, #100): Home is composition only (`features/home/presentation/pages/home_page.dart`), in this order: flash-sale strip (Farhan's), Banners carousel, Section chips, Ayah of the Day, New arrivals, Bestsellers, Collections, Bites, "Used books from readers". Each part loads through its own provider with a skeleton and retry. Banners come from Home's own fake API (`/home/banners`, `home_fake_api.dart`, `GetBanners`); a `BannerTarget` (Collection, Section, Book or search) is mapped to a route by `bannerRoute` in `banner_card.dart`. New arrivals and Bestsellers come from `searchCatalog` (`GetNewArrivals`, `GetBestsellers`); "See all" opens `CatalogRoutes.searchFor(sort:)`, and Search also reads `?q=`. Every book card shows Waraqah's From-price, list price when discounted, and stock, and opens the book page.
- **Religious section is done** (Rahinur, #100): the Beneficial / Non-Beneficial filter and `Book.isBeneficial` are gone. Staff-picked **Collections** replace them: page at `CatalogRoutes.collectionFor(id)`, fake API `/collections` and `/collections/detail` (`collection_fake_api.dart`), use cases `GetCollections` / `GetCollection`, widgets `CollectionTile` and `CollectionStrip`. Any Section page with Collections shows a strip (Religious has 3); Home shows all 5. Ayah of the Day is on by default; readers hide it with the ✕ (with Undo) or the switch in Profile's "Home" group (`AyahSwitchTile`, saved on the device by `ayah_visible_provider.dart`).
- **There is no backend yet.** All data comes from a **fake API** inside the app (§4.4). A Go backend will come later, in a separate repository. Code as if the API were real: going live must only mean changing the API address.
- `main` passes `flutter analyze` with no issues, and all tests pass.

---

## 3. Tech stack

| Area | Choice |
|---|---|
| Framework | Flutter (Dart SDK ^3.13), one app for Android, iOS, web and desktop |
| State | **Riverpod 3** (`flutter_riverpod`). The only state library. |
| Routing | **go_router 17** with a `StatefulShellRoute` for the 5 tabs |
| Networking | **Dio 5**, one instance from `dioProvider` |
| Models | **freezed 4 + json_serializable** (codegen with `build_runner`) |
| Localisation | `flutter_localizations` + ARB files, **English and Bangla** (`AppL10n`) |
| Storage | `shared_preferences` (settings, session) |
| UI | `google_fonts`, `shimmer`, Material 3 with our own theme |
| Tests | `flutter_test`, `fake_async` |
| Backend (later) | Go + PostgreSQL, separate repo |

---

## 4. Architecture

**Feature-based "LEGO" architecture with Clean Architecture inside each feature.** Each feature is an independent block; shared code lives in `core/`.

### 4.1 Folder layout

```
lib/
├── main.dart               runApp(await AppBootstrap.start()) — no widgets here
├── app/
│   ├── app.dart            MaterialApp.router: theme, locale, router
│   ├── app_bootstrap.dart  opens SharedPreferences, sets up ProviderScope + fake API
│   ├── fake_api_routes.dart  one line per feature's fake API
│   ├── router/             app_router.dart, route_access.dart, router_provider.dart, shell_tabs.dart
│   └── shell/              bottom nav (phones), side rail (desktop), AI button
├── core/                   shared by all features — never imports a feature
│   ├── models/             Book, Edition (the only cross-feature models)
│   ├── network/            dio_provider, dio_client, fake_api_interceptor, api_config
│   ├── settings/           settingsProvider (theme, locale), sharedPreferencesProvider
│   ├── theme/              AppPalette, AppTheme, AppFonts, Insets / Radii / Sizes
│   ├── widgets/            shared bricks: AsyncView, CoverArt, SurfaceCard, buttons…
│   ├── state/              selectionProvider<T>
│   ├── usecase/            UseCase<Result, Params>, NoParams
│   ├── cache/              TtlCache
│   └── utils/              Bdt.format (৳ prices), stock labels, cover gradients
├── features/
│   ├── admin/  ai_assistant/  auth/  bites/  catalog/  home/  p2p/  profile/
└── l10n/                   app_en.arb, app_bn.arb (+ generated AppL10n)
```

### 4.2 Inside a feature

```
features/<feature>/
├── <feature>_routes.dart     the feature's paths and GoRoutes
├── domain/
│   ├── entities/             freezed classes, no JSON
│   ├── repositories/         abstract interfaces
│   └── usecases/             one class per action, extends UseCase<Result, Params>
├── data/
│   ├── models/               freezed + JSON, with toEntity()
│   ├── sources/              <x>_remote_source.dart (Dio), <x>_fake_api.dart, fixtures
│   └── repositories/         implementations (wrap results in TtlCache where useful)
└── presentation/
    ├── pages/                one page per screen
    ├── providers/            <feature>_providers.dart
    └── widgets/              everything else, as small bricks
```

**Data flow:** Widget → provider → use case → repository → remote source → `dioProvider` → fake API (later the Go backend).

**Cross-feature rule:** a feature may use another feature only through its **public providers, use cases or entities**, never its `data/` layer. Example: Home gets new arrivals through the catalog's `bookRepositoryProvider` via a use case.

### 4.3 Routing

- Each feature has `<feature>_routes.dart` exporting:
  - path constants (e.g. `CatalogRoutes.catalog`, `CatalogRoutes.bookDetailFor(id)`)
  - `routes`: full-screen pages that open over the tabs (book detail, AI chat, admin…)
  - `branch`: the feature's tab, if it has one
- `app/router/app_router.dart` only assembles them. **Add routes in your own feature's routes file.** Touch `app_router.dart` only when adding a brand-new feature.
- The 5 tabs are Home, Catalog, P2P, Bites, Profile (order in `shell_tabs.dart`).
- Never hard-code a path string in a widget; use the routes constants.
- **Access rules** live in `app/router/route_access.dart`:
  - everything under `/admin` is staff only (guests → login, readers → home)
  - `RouteAccess.signedInOnly`: add pages that need a signed-in user (checkout, orders…)
  - the router re-checks automatically when the user signs in or out

### 4.4 Fake API (no backend yet)

- `dioProvider` has a `FakeApiInterceptor`. It answers **exact paths** from a route table after about 900 ms (so loading skeletons show), and returns **404 for unknown paths**.
- Each feature has its own fake API in `data/sources/<name>_fake_api.dart`:

  ```dart
  abstract final class AuthFakeApi {
    static const String login = '/auth/login';
    static final Map<String, Object? Function(RequestOptions)> routes = {
      login: _login,
    };
    static Object _login(RequestOptions options) { /* read options.data, return JSON */ }
  }
  ```

  Register it with **one line** in `app/fake_api_routes.dart` (`...YourFakeApi.routes`).
- Paths are matched exactly, so **use query parameters instead of path parameters** (`/books/details?id=…`, not `/books/:id/details`). Read the body from `options.data` and the query from `options.queryParameters`.
- Handlers return JSON built from fixtures in the same `data/sources/` folder.
- **Remote sources must never catch `DioException` to fall back to fixtures.** Errors surface to the UI's error state.
- Going live later = point `ApiConfig.baseUrl` at the Go service and remove the interceptor.

### 4.5 Accounts and roles (already built)

- `sessionProvider` (in `features/auth/presentation/providers/auth_providers.dart`): the current `AppUser`, or **`null` for a Guest**. Call `.notifier.signIn(email:, password:)` / `.signOut()`.
- `AppUser.role` is a `UserRole`: `reader`, `moderator`, `catalogManager`, `support`, `superAdmin`.
  - `role.isStaff`, `role.canModerate`, `role.canManageCatalog`, `role.canManageOrders`
- `isStaffProvider`: quick boolean.
- **Demo accounts** (any password): `admin@waraqah.test` (super admin), `moderator@waraqah.test`, `catalog@waraqah.test`, `support@waraqah.test`. Any other email signs in as a reader.

### 4.6 Admin area (already built)

- `/admin` is a staff-only hub listing **Admin sections** the viewer may open. It's reached from Profile.
- Sections are the `AdminSection` enum (`features/admin/domain/entities/admin_section.dart`): `dashboard` (all staff), `catalog` (catalog manager), `orders` (support), `moderation` (moderator); super admin opens all. `canOpen(role)` drives both the menu and the guard.
- Each owner **replaces their own line** in `AdminRoutes.routes` with the real page. Link with `AdminRoutes.section(AdminSection.orders)`.

---

## 5. Rules every change must follow

These come from the instructor and the team. Breaking them fails review.

**Code structure**
1. **No hand-written file over 120 lines.** Split widgets into small bricks. Generated files are exempt.
2. **`main.dart` contains no widgets.**
3. **LEGO + Clean Architecture** as in §4.2. One page per screen; the rest are widgets.
4. **Use the shared bricks in `core/widgets/`** before making new ones. Only Rahinur changes `core/` (ask, or build it inside your feature first).

**State and data**
5. **Riverpod only.** No `provider` package, no `ChangeNotifier`, no `setState` for shared state. Use a `Notifier` only when state has real actions; for a simple one-value choice use `selectionProvider<T>(initial)`.
6. **Providers call use cases, not repositories** (`UseCase<Result, Params>`; `NoParams` when there's no input).
7. **Entities in `domain/entities/`** (freezed, no JSON); **models in `data/models/`** (freezed + JSON) with `toEntity()`.
8. **All data goes through `dioProvider`** and the fake API (§4.4).

**UI**
9. **Every string comes from the ARB files**, in **both** `app_en.arb` and `app_bn.arb`. Read them with `AppL10n.of(context)!`. No user-facing text literals in widgets.
10. **Colours come from `AppPalette`** via `context.palette`, so light and dark mode both work. No hard-coded colours. Text styles from `AppFonts`, spacing from `Insets` / `Radii` / `Sizes`.
11. **Every async screen or section** renders through `AsyncView` (or `AsyncSliverView`) with a **shimmer skeleton** shaped like the real content, plus an error state with retry.
12. **Size cards with `AspectRatio` or max-extent grids**, never fixed widths or heights. Test at phone width (375 px).
13. Prices in taka through `Bdt.format(...)` (`core/utils/formatters.dart`).

**Tests**
14. Business logic needs unit tests. New screens need a widget test that renders them without exceptions.
15. `flutter analyze` must report no issues and `flutter test` must pass before opening a PR.

---

## 6. Domain vocabulary

Use these words in code, tests and PRs. Don't drift to the "avoid" words.

| Term | Meaning | Avoid |
|---|---|---|
| **Book** | A title in the catalog, independent of how it's printed. One Section, one Category, one or more Editions. | product, item |
| **Edition** | One buyable version of a Book: a Format in a language, with its own price and stock. | variant, SKU, offer |
| **Format** | paperback, hardcover or eBook | binding |
| **Translation** | An Edition in a language other than the Book's original. Not a separate Book. | |
| **Section** | One of the 8 fixed top-level shelves | department, genre |
| **Category** | A group of Books inside one Section, with an English and a Bangla name. Staff manage the list. | subcategory |
| **Author** | The person who wrote a Book. A Book has exactly one Author for now. | writer |
| **Publisher** | The company that published a Book. A Book has exactly one Publisher. | brand, prokashoni |
| **Series** | Books meant to be read in order. May list titles Waraqah doesn't sell yet. | collection (that's a Collection) |
| **Collection** | An ordered set of Books picked by Staff, with a title and a short note on why they were picked. May belong to one Section. Not read in order (that's a Series) and not bought together (that's a Booklist). | list, shelf, bundle |
| **From-price** | Price shown before an Edition is chosen: the cheapest orderable Edition (`book.fromPriceBdt`) | lowest vendor price |
| **New arrival** | A Book recently added to Waraqah's catalog, not recently published | new release |
| **Bestseller** | A Book ranked by copies Waraqah sold in the last 30 days, all Editions together (used copies not counted) | top seller, popular |
| **Banner** | A promo tile at the top of Home, made by Staff: a title, a subtitle and one link to a Collection, Section, Book or search | ad, slider, hero |
| **Ayah of the Day** | A daily Quran verse on Home. Readers can turn it off. | |
| **List price** | An Edition's price before discount (`listPriceBdt`) | MRP, original price |
| **Stock / Pre-order** | Copies Waraqah can ship now / not released yet but orderable | |
| **Guest** | Using the app without signing in (no Role) | |
| **Reader** | A signed-in customer. Not staff. | normal user |
| **Staff** | Any account whose Role isn't Reader. Only staff open the Admin area. | admin (for the group) |
| **Admin area / Admin section** | The staff-only area / one area of work inside it | back office, module |
| **Listing** | A used book a Reader offers for sale (second-hand) | post, ad |
| **Certified Used** | A used book Waraqah bought back, inspected and resells itself | refurbished |
| **Sell Back** | A Reader selling a used book to Waraqah for an instant quote | trade-in (in UI text) |
| **Booklist** | Any list of books needed together (class list, exam prep, a reader's own list) | course list |
| **Bite** | A short post in the Book-Bites feed | tweet |

---

## 7. Who owns what

Build **only your own area**. If you need something from another area that isn't merged yet, **fake it inside your own feature folder**, using the same names and fields the owner will use, and switch to the real one when it's merged.

| Person | Area |
|---|---|
| **Rahinur** | Storefront & catalog: Section/category/author pages, search (incl. Bangla + Banglish), home feed, seasonal home, collections & Expert Picks, Booklists, Religious section, Academic browsing, design system, `core/`. **Admin:** catalog, banners, collections. |
| **Farhan** | Book page & buying new: book page (editions, formats, stock, delivery), wishlist, **cart**, checkout (bKash / Nagad / COD / card), orders & returns, "every way to buy" (new + used on one page), alerts, pre-orders, bundles, flash sales, loyalty points, Smart Basket, gift & donate, wallet. **Admin:** orders, returns, coupons. |
| **Arifin** | Second-hand & moderation: listing flow, listing status, used marketplace, chat & offers, meetups, seller profiles & ratings, report & block, scan a book, fair price meter, Request a book, Waraqah-handled sales, Sell Back & Certified Used, "Finished it? Sell it". **Admin:** Moderation Center, trade-in grading. |
| **Niloy** | Accounts, community & AI: sign up / log in, profile & saved addresses, notifications, shelves & reading stats, Book-Bites (post, like, comment, spoilers, follow, quote cards), reviews, AI assistant. **Admin:** dashboard. |

### Shared pieces

The owner builds these and keeps their shape stable; everyone else uses them.

| Piece | Owner | Used by |
|---|---|---|
| `Book` / `Edition` models, design system, `core/` | Rahinur | everyone |
| Catalog search, collections & Booklists data | Rahinur | Niloy (AI), Farhan |
| **Add to cart** (new edition, Certified Used, reader listing) | Farhan | Rahinur, Arifin, Niloy |
| Payment method picker, wallet credit | Farhan | Arifin |
| **Used options for a book** (Certified Used price, cheapest listing, count), resale value | Arifin | Farhan, Rahinur, Niloy |
| Report content, create a book request, barcode scanner | Arifin | Niloy, Rahinur |
| `sessionProvider` & roles | (built) | everyone |
| Saved addresses, send a notification, "book finished" event | Niloy | Farhan, Arifin, everyone |
| Reviews and "Bites about this book" widgets | Niloy | Farhan (book page) |

---

## 8. Working rules

**Branches and PRs**
- **One branch per feature** off the latest `main` (e.g. `feature/cart`, `feature/listing-flow`). Small PRs, one feature each.
- **Pull `main` often:** `git pull origin main`.
- **Nobody merges their own PR.** Reviewers: Rahinur → Farhan merges, Farhan → Arifin, Arifin → Niloy, Niloy → Rahinur.
- Merge with **"Create a merge commit"** (never squash).
- Commit messages: a clear title (`feat(cart): …`), then *what* and *why*, with `Committed by:` and `Feature:` lines.
- **Keep AI tool files and AI attribution out of the repo.** Don't commit agent context files (like this one) or "generated by / co-authored by AI" lines.

**Avoiding conflicts**
- **ARB keys:** add yours in your own block with your prefixes:
  - Rahinur: `home`, `search`, `section`, `collection`, `expert`, `booklist`, `adminCatalog`
  - Farhan: `book`, `cart`, `checkout`, `order`, `wishlist`, `wallet`, `gift`, `adminOrder`
  - Arifin: `listing`, `used`, `chat`, `seller`, `sellBack`, `scan`, `request`, `report`, `moderation`
  - Niloy: `auth`, `profile`, `notification`, `shelf`, `bite`, `review`, `ai`, `adminDashboard`
- Routes and fake APIs: only in **your own feature's files**, plus one line in the shared lists when adding a new feature.
- **Announce before adding a package** to `pubspec.yaml`.
- **Only stage your own files.** Codegen and `pub get` often rewrite other people's generated files (`*.g.dart`, `*.freezed.dart`, platform plugin files) with **line-ending-only** changes. Check with `git diff --ignore-cr-at-eol` and don't commit those.

---

## 9. Commands

```bash
flutter pub get                      # also regenerates AppL10n
dart run build_runner build          # after changing any freezed / JSON model
flutter gen-l10n                     # after editing the ARB files
flutter analyze                      # must be clean
flutter test                         # must pass
flutter run -d chrome                # Windows desktop needs Developer Mode; Chrome doesn't
```

Commit generated files (`*.freezed.dart`, `*.g.dart`, `lib/l10n/app_localizations*.dart`) along with your change.

**Widget tests:** use `test/helpers/app_harness.dart`:
- `openApp(tester, location, role: 'superAdmin')` opens the real app at phone size, signed in (or a guest when `role` is null)
- `openApp(..., prefs: {...})` starts with those values already saved on the device (e.g. to test what survives a restart)
- `settle(tester)` waits for fake API calls
- `pathOf(router)` gives the current page

Set `GoogleFonts.config.allowRuntimeFetching = false` in `setUpAll`.

---

## 10. Known gaps (don't be surprised by these)

- The AI assistant still shows an old vendor price table. It's scheduled to use Waraqah's own catalog (Niloy). Don't copy it.
- `BookDetailsSource` (catalog) still catches `DioException` and falls back to fixtures, which breaks rule 8. Scheduled to move to a fake API route (Farhan).
- Sign-up doesn't create an account yet; it just opens the app. "Continue with Google" signs in as a demo reader. Real sign-up is Niloy's task.
- Profile stats (books read, Bites posted, listings) are placeholder numbers.
- `.env` is still tracked in git even though `.gitignore` lists it. It holds a publishable key, not a secret; it should be removed from tracking.
- Search's "Request this book" opens a stand-in page (`CatalogRoutes.requestBook`) until the Request a Book flow lands (Arifin). Point it at the real flow then.
- "Add to cart" on the book page shows a "coming soon" message until the cart exists (Farhan).
