# Waraqah — Project Context for Coding Agents

Read this before writing any code in this repo. It describes what Waraqah is, how the code is organised, the rules every change must follow, and who owns what.

This file is committed at the repo root so the whole team works from the same picture. **When you finish a feature, update §2 (Current status) and §10 (Known gaps) in the same PR.**

---

## 1. What Waraqah is

Waraqah is a **book store app for Bangladesh**, like Rokomari, with two connected marketplaces:

- **First-hand (new books):** Waraqah runs its own store. **Staff** add books, set prices and manage stock. Readers buy with bKash, Nagad, cash on delivery or card.
- **Second-hand (used books):** Readers list their own used books. **Every listing is approved by a moderator** before it goes live. Buyers send offers that land in the seller's inbox, chat there to arrange a meetup or courier (payment happens outside the app), or let Waraqah handle the sale.

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

- **Setup is done:** Book model with Editions, per-feature routes and fake APIs, login state and roles, and the Admin area shell.
- **Browsing pages are done** (Rahinur, #87): Section, Category, Author, Publisher and Series pages, inside the Catalog tab so the bottom nav stays. Routes are in `CatalogRoutes` (`sectionFor`, `categoryFor`, `authorFor`, `publisherFor`, `seriesFor`); pages in `features/catalog/presentation/pages/`; fixtures in `features/catalog/data/sources/` (`*_fixtures.dart`, `seed/`).
- **Search is done** (Rahinur, #99): `/catalog/search` (`CatalogRoutes.search`, `search_page.dart`). Live search by title, Author, Publisher or ISBN; filters (Section, price, format, language, rating, in stock); sort (relevance, price, newest, bestselling); recent searches kept on the device. Every catalog query goes through `BookRepository.searchCatalog(CatalogFilters)` (`domain/entities/catalog_filters.dart`); state in `search_providers.dart` and `recent_searches_provider.dart`. No results shows "Request this book".
- **Home feed is done** (Rahinur, #100): Home is composition only (`features/home/presentation/pages/home_page.dart`), in this order: flash-sale strip (Farhan's), Banners carousel, Section chips, Ayah of the Day, New arrivals, Bestsellers, Collections, Expert Picks, Bites, "Used books from readers". Each part loads through its own provider with a skeleton and retry. Banners come from Home's own fake API (`/home/banners`, `home_fake_api.dart`, `GetBanners`); a `BannerTarget` (Collection, Section, Book or search) is mapped to a route by `bannerRoute` in `banner_card.dart`. New arrivals and Bestsellers come from `searchCatalog` (`GetNewArrivals`, `GetBestsellers`); "See all" opens `CatalogRoutes.searchFor(sort:)`, and Search also reads `?q=`. Every book card shows Waraqah's From-price, list price when discounted, and stock, and opens the book page.
- **Religious section is done** (Rahinur, #100): the Beneficial / Non-Beneficial filter and `Book.isBeneficial` are gone. Staff-picked **Collections** replace them: page at `CatalogRoutes.collectionFor(id)`, fake API `/collections` and `/collections/detail` (`collection_fake_api.dart`), use cases `GetCollections` / `GetCollection`, widgets `CollectionTile` and `CollectionStrip`. Any Section page with Collections shows a strip (Religious has 4); Home shows all 9. Expert Picks get their own strips (see below). Ayah of the Day is on by default; readers hide it with the ✕ (with Undo) or the switch in Profile's "Home" group (`AyahSwitchTile`, saved on the device by `ayah_visible_provider.dart`).
- **Admin: catalog is done** (Rahinur, #123): `features/catalog_admin`, Admin → Catalog (`AdminRoutes.section(AdminSection.catalog)`).
  - Tabs: Books, Categories, Authors, Publishers, Banners, Collections. The Book form (`CatalogAdminRoutes.newBook`, `bookFor(id)`) has the details, a cover colour (gradient seed) and Editions with price and stock; Hide / Show again.
  - Rules in `CatalogAdminRules`: the form shows them inline, and the server refuses a change that breaks one. A Category, Author or Publisher can be deleted only when no Book uses it. Renaming an Author renames it on all their Books.
  - Fake API `/admin/catalog/...` (`CatalogAdminFakeApi`). The fixture lists (`BookFixtures.all` and the Category, Author, Publisher, Collection, Booklist and Banner fixtures) are edited in place and reset with each new fake backend (`CatalogAdminFakeStore`). Keep reading them as before.
  - `Book` now has `hidden` and `titleBn`. Hidden Books leave `/books` (Search, Section pages, Home) and Collections; Staff's list reads `/books?includeHidden=true` (`CatalogFilters.includeHidden`). The book page loads through `/books/detail` (`BookRepository.findById`), so a hidden Book still opens from an old link.
- **Bangla + Banglish search is done** (Rahinur, #124): one phonetic key (`PhoneticKey`, `features/catalog/data/sources/phonetic_key.dart`, fake backend side) matches Bangla script, Banglish and English spellings of titles (`Book.titleBn`), Authors and Publishers: "স্যাপিয়েন্স", "sapiyens" and "sapiens" all find Sapiens. `/books` tries it after the exact matches (`BookSearchMatch`). Suggestions (`/books/suggest`, `BookRepository.suggest`) show as chips while typing (`SearchSuggestions`); "Did you mean…?" (`/books/did-you-mean`, `BookRepository.didYouMean`) shows above "Request this book" when nothing matches. Both answer in the script the reader typed. Search result rows show the Bangla title under the title.
- **Seasonal home is done** (Rahinur, #124): `/home/season` picks Ramadan, Boi Mela, Admission or Back to school by date (one at a time, Ramadan first; `SeasonPicker`, dates in `season_fixtures.dart`); staff can force one in Admin → Catalog → Banners (`/admin/catalog/season`). Home shows a Season hero card (`SeasonHeroCard`, `homeSeasonProvider`) above the Banners that opens the Season's Collection (`col-ramadan`, `col-boi-mela`, `col-admission`, `col-back-to-school`). A Banner can belong to a Season (`Banner.season`): `/home/banners` puts the active Season's Banners first and leaves out other Seasons'. Admin's Banners tab lists every Banner from `/admin/catalog/banners`.
- **Collections and Expert Picks are done** (Rahinur, #125): Experts (`/experts/detail`, `CatalogRoutes.expertFor`) are verified teachers, scholars and writers; an Expert Pick is a Collection with `expertId` (the API embeds its `expert`). Home and Section pages show Collections and Expert Picks strips (`staffCollectionsProvider`, `expertPicksProvider` in `expert_providers.dart`; `collectionsProvider` still returns both). Admin → Catalog → Collections builds both Collections and Staff Booklists (`CollectionFormPage`, `CatalogAdminRoutes.newCollection` / `newBooklist`, rules in `ListRules`); `BookPickerSheet` (`features/catalog/presentation/widgets/`) adds books.
- **Booklists are done** (Rahinur, #125): `CatalogRoutes.booklists` / `booklistFor(id)`, fake API `/booklists`, `/booklists/detail`, `/booklists/mine/save|delete` (`booklist_fake_api.dart`), providers in `booklist_providers.dart`. Staff lists (class list, exam prep, book club) and a Reader's own lists (`MyBooklistUi` on `WidgetRef`). Each row shows New, Certified Used and Used prices; 'Add whole list to cart' adds each orderable Book's From-Edition. Ways in: a Booklists card under the Catalog's Section grid and `MyBooklistsLink` in Profile.
- **Academic and School browsing is done** (Rahinur): `Book.classes` (6–12), `exams` (`Exam`: SSC, HSC, admission, BCS) and `subjectId`, all optional; Subjects come from `/subjects` (`SubjectFixtures`, `subjectsProvider`). `/books?class=&exam=&subject=` (`CatalogFilters.classLevel`, `exam`, `subjectId`). School & College, Admission & Job Prep and Academic pages show `AcademicFilterBar` under the Category chips: Class, Exam and Subject chips per Section (`SectionAcademics` in `core/models/section_academics.dart`), narrowing the list in place (`sectionFiltersProvider`). The Book form has the same rows (`AcademicFields`), and `CatalogAdminRules` refuses a Class or Exam the Section doesn't offer. Seeds: `seed/textbook_shelf.dart` and `textbook_more_shelf.dart`.
- **Admin: catalog tools are done** (Rahinur): ISBN lookup on the Add book form (`/admin/catalog/isbn-lookup`, `IsbnLookupField`): a Book already in the catalog offers Open; one from outside fills the form, and an unknown Author or Publisher opens Add new filled in. CSV import by paste (`/admin/catalog/import`, `CatalogAdminRoutes.importCsv`, `CsvImport.parse`; one row per Edition, new Authors and Publishers created). A Low stock list with inline stock edits (`/admin/catalog/low-stock`, `CatalogAdminRoutes.lowStock`, printed Editions with stock ≤ `CatalogAdminRules.lowStock` = 5). Both pages open from the ⋮ menu on the Books tab; the endpoints are in `CatalogToolsFakeApi`.
- **Buying new is done** (Farhan):
  - **Book page:** Editions and formats, stock and delivery estimate, Look Inside, series, questions, lowest-price badge, price and stock alerts, and "Other ways to buy": a Certified Used copy (into the cart), readers' copies (open the listing to make an offer) and the resale value.
  - **Cart** (`features/cart`): `ref.addToCart(context, CartItemRef.edition(id) | .certifiedUsed(id) | .bundle(id))`; flash sales and bundles (`features/deals`); Smart Basket (budget, used swaps).
  - **Wishlist** (`features/wishlist`), with a share link friends open without an account (`WishlistRoutes.sharedFor(id)`).
  - **Checkout** (`features/checkout`): address, delivery, bKash / Nagad / COD / card, coupons, Waraqah points (`features/loyalty`), wallet, and "Send as a gift" (card message, gift wrap, no prices). The maths is one place: `CheckoutTotals`.
  - **Orders and returns** (`features/orders`): tracking, cancel, returns with photos; refunds go to the wallet (`OrderRefunds`).
    - **Buy again** puts a delivered or cancelled order's Editions back in the cart (`/orders/reorder`). Order lines keep their `editionId` for this.
    - Each order has an **invoice** (`OrdersRoutes.invoiceFor(number)`).
    - The **return policy** (`OrdersRoutes.returnPolicy`, `/return-policy`) is open to guests too. Its wording matches the rules in code.
  - **Admin → Orders:** orders, returns and coupons.
  - **Donate books** (`/donate`, `features/donate`) to verified places, and the **Wallet** (`/wallet`, `features/wallet`).
- **Offers and inbox are done** (Farhan, #109). They follow the Chat & Meetup plan:
  - A buyer makes an offer (price, meetup or courier). It lands in the seller's inbox in a thread: one per buyer per Listing.
  - The seller accepts (the Listing becomes **Reserved**) or declines. Both chat in the thread.
  - The seller can make the book available again or mark it sold. **Those changes only happen in the thread with that buyer.**
  - Payment happens outside the app.
  - Code: `features/inbox`. Routes: `InboxRoutes.inbox` (`/p2p/inbox`) and `threadFor(id)`.
  - Starting points: `ref.openChat(context, listing)` and `ref.offerOn(context, listing)`. The header icon `InboxButton` carries the unread badge, which is the notification.
  - Updates arrive live (§4.4).
- **P2P listings go through the fake API** (`P2pFakeApi`, `P2pFakeStore`; #109). A `P2pListing` knows its `sellerId`, `isMine` and `isMyDeal`, and its status includes `reserved`. Listings show the seller's area, not a university batch.
- **Seller pages and ratings are done** (Farhan, #110):
  - `P2pRoutes.sellerFor(id)` shows name, area, member since, books sold, rating, reviews and what's on sale now.
  - After a sale, buyer and seller rate each other once in the thread (`RatingRules`: 1–5 stars, comment up to 300 characters).
- **Report and block are done** (Arifin):
  - Report from any page with `ref.report(context, ReportTarget(kind: ReportTargetKind.listing | user | message | bite | comment | review, id: ...))`: a sheet with a reason and an optional note (`ReportRules`: "Something else" needs a note, up to 500 characters; only Listings offer "Photocopy"). Guests log in first.
  - Ready-made bricks in `features/report/presentation/widgets/`: `ReportMenuButton` (the ⋮ menu: report, plus block or unblock a reader), `ReportIconButton` (a small flag, on Bites and reviews) and `ReportOnLongPress` (on the other person's messages).
  - Blocking: `ref.block(context, readerId, name)` / `ref.unblock(...)`, `isBlockedProvider(readerId)`. Blocked sellers' Listings leave the marketplace, Home and the book page; their Listing page shows "You blocked …" instead of the offer bar. Profile → **Blocked readers** (`ReportRoutes.blocked`, `/blocked`) lists them to unblock.
  - Fake API: `/reports`, `/blocks`, `/blocks/add`, `/blocks/remove` (`ReportFakeApi`, `ReportFakeStore`, shared with `P2pFakeApi` through `isBlocked`). The server refuses reporting or blocking yourself.
  - The add-listing form shows the rules first (`ListingRulesCard`): no photocopies, no pirated books, honest condition.
- **Moderation Center is done** (Arifin): `features/moderation`, page at `AdminRoutes.section(AdminSection.moderation)`. Four tabs:
  - **Listings to approve:** every Listing `inReview`, with photos, condition, flags, note, price vs new and the seller's strikes. Approve (goes live), Ask for changes or Reject; both need a reason the seller sees (`ModerationRules`: up to 300 characters, with one-tap reasons).
  - **Reports:** open reports, one card per reported thing (with how many readers reported it), showing what was reported and whose it is. Remove (a Listing is taken down), Dismiss, Warn or Ban (with a confirm). Acting closes every open report on that thing.
  - **Disputes:** empty until Waraqah-handled sales.
  - **Log:** every action, newest first: what, on what, why, who and when.
  - One strike system: a warning adds a strike, the third bans (`ModerationRules.maxStrikes`). Banned sellers' Listings leave the marketplace like blocked ones.
  - Fake API `/moderation/listings`, `/moderation/listings/decide`, `/moderation/reports`, `/moderation/reports/act`, `/moderation/log` (`ModerationFakeStore`, shared with `P2pFakeStore` and `ReportFakeStore`). It finds reported messages, Bites and reviews in their features' own records (`ModerationSubjects`). Until there are login tokens, the app sends the staff member's name (`by`) for the log.
- **Scan a book is done** (Arifin): one scanner (`features/scan`, `ScanRoutes.scan`) to look a book up or start a used Listing.
  - The camera reads the EAN-13 barcode on the back of a book (`mobile_scanner`, on Android, iOS, macOS and the web); the ISBN can also be typed. Windows, Linux and tests type it.
  - `Isbn.normalize` checks the check digit and turns an ISBN-10 into an ISBN-13. Fake API `/scan/lookup?isbn=` answers the Book (`ScanFakeApi`).
  - Found: open the book page, or **Sell your copy** (the add-listing form starts with the Book's title and new price). Not found: Request this book, or list it anyway.
  - Drop in `ScanButton()` to open it (Search's field and the P2P header have one). `ScanButton(forSell: true, wide: true)` on the add-listing form fills the form in.
- **Fair price meter is done** (Arifin): under the price on the add-listing form, `FairPriceMeter` shows "Fair price: ৳700–৳960" from the Book's new price, the condition and the flags (`FairPrice.of`: Like New 60–75% of new, Very Good 50–65%, Good 40–55%, Acceptable 25–40%, 5% off per flag, rounded to ৳10). A bar marks the asking price, and it warns when the price is as much as buying new. It needs a catalog Book (scanned), so a typed title shows a hint instead. The form's steps are now separate widgets (`listing_*_step.dart`).
- **Request a book is done** (Arifin): `features/book_request`.
  - `BookRequestRoutes.newFor(title:, bookId:)` (`/request-book`) is the form: title, author, most you'd pay, note (`RequestRules`). Guests log in to send. Search's "Request this book" and the scanner's "not found" open it (the catalog's stand-in page is gone).
  - Sending tells the readers who have the book: the answer says how many (`notifiedSellers`) and how many copies are on sale now (`matchCount`). A Listing matches by catalog Book or by title words (`RequestRules.matches`).
  - **My book requests** (`BookRequestRoutes.requests`, signed-in only, linked from Profile): See copies (the marketplace searching for it) or Close.
  - Sellers see **Readers want your books** on My Listings (`wantedBooksProvider`).
  - Demand for admins: `bookDemandProvider` (titles, most asked first), ready for the admin dashboard.
  - Fake API `/requests`, `/requests/mine`, `/requests/close`, `/requests/wanted`, `/requests/demand` (`BookRequestFakeStore`, sharing `P2pFakeStore`).
- **Waraqah-handled sales are done** (Arifin): `features/handled_sale`.
  - A live Listing shows **Let Waraqah handle it** (`HandledSaleCard`). The buyer pays the price plus ৳80 courier delivery by bKash, Nagad or card (no cash on delivery: Waraqah holds the money). The Listing becomes Reserved.
  - A sale goes paid → sent (the seller marks it) → completed (the buyer confirms it's as described; the seller gets the price minus a 5% fee, at least ৳10, from `SaleMath`). Before it's sent, the buyer can cancel, and the money goes back to their wallet.
  - **Report a problem:** a reason, a note and up to 3 photos (Farhan's `ReturnPhotosPicker`). It goes to the Moderation Center's **Disputes** tab, where a moderator refunds the buyer (to the wallet; the Listing goes live again) or pays the seller. Both go into the audit log.
  - Pages: `HandledSaleRoutes.sales` (`/sales`, buying and selling, linked from Profile), `saleFor(id)`, `buyFor(listingId)` and `earnings`: held, earned, paid out, and "Pay ৳X to my bKash". Everything under `/sales` is signed-in only.
  - Fake API `/sales/...` (`HandledSaleFakeStore`, sharing `P2pFakeStore`, `WalletFakeStore` and `ModerationFakeStore`). Seeds: a sale the reader bought (on its way), two they sold (one paid, one completed and paid out), and a dispute. In the demo, another seller sends the book 4 s after it's paid, so tests that buy must `pump(const Duration(seconds: 5))` and `settle`.
- **Sell Back and Certified Used are done** (Arifin): `features/sell_back`.
  - `SellBackRoutes.sellBack` (`/sell-back`, `sellBackFor(bookId)`; signed-in only; linked from Profile and from the scanner's result): pick the book from the catalog, say its condition and flags, and get an **instant price** (`SellBackRules.quote`: Like New 35% of the cheapest printed Edition, Very Good 30%, Good 25%, Acceptable 15%, 5% off per flag, at least ৳30). Then book a courier pickup. **My Sell Backs** (`SellBackRoutes.mine`) tracks each one: pickup booked → being checked → paid, or sent back.
  - **Admin → Trade-ins** (`AdminSection.tradeIn`, catalog managers and super admin): staff set their own grade, then **Pay ৳X · sell for ৳Y**. Waraqah pays at that grade into the reader's wallet (`WalletReason.sellBack`) and publishes it as **Certified Used** (`SellBackRules.resellPrice`: 65/55/45/35% of new). Or they **Send it back**.
  - **Certified Used stock** is `CertifiedUsedStock` (fake backend). The catalog's `UsedOptionsFixtures` reads it, so a published copy shows on the book page's "Other ways to buy" and goes in the cart. It starts with the demo Atomic Habits and Sapiens copies, and resets with each new fake backend.
  - Fake API `/sell-back/...` (`SellBackFakeStore`, sharing `WalletFakeStore`). In the demo the courier picks a book up 4 s after it's booked; tests that book one must `pump(const Duration(seconds: 5))` and `settle`.
- **"Finished it? Sell it" is done** (Arifin): `features/finished_it`.
  - `ref.bookFinished(context, bookId)` opens **Finished Sapiens?**: what readers pay for a copy read once (`FinishedItOffers`: the Like New fair range), **List it for readers** (the add-listing form filled in: title, new price, Like New), or **Sell it back to Waraqah** (Sell Back's quote for the book), or Keep it.
  - **Niloy:** when a book moves to Finished on a shelf, call `ref.bookFinished(context, bookId)`.
  - Until shelves exist, My Listings shows **Finished a book you bought?** with the books from the reader's delivered orders (`boughtBooksProvider`, from Farhan's `myOrdersProvider`).
- **Accounts** (Niloy, #108): sign-up with a one-time code (OTP), log in, Continue with Google and password reset, all through Auth's fake API (`/auth/...`).
- **AI assistant** (Niloy): answers from Waraqah's catalog with a local bot. It uses Gemini when built with `--dart-define=GEMINI_API_KEY=...`.
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
| Barcode scanner | `mobile_scanner` (camera; Android, iOS, macOS, web) |
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
│   ├── admin/  ai_assistant/  alerts/  auth/  bites/  book_request/  cart/  catalog/  checkout/
│   ├── finished_it/  handled_sale/  sell_back/
│   ├── deals/  donate/  home/  inbox/  loyalty/  moderation/  orders/  p2p/  profile/  report/  scan/
│   ├── wallet/  wishlist/
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
- A handler answers `null` when the server would refuse (not allowed, unknown id). The remote source turns a refused change into an error.
- **Shared fake stores.** Stores that several features change are created once in `fake_api_routes.dart` and passed to each feature's `routes(...)`. For example:
  - checkout, orders and the wallet share `OrderFakeStore` and `WalletFakeStore`;
  - the inbox reserves and sells `P2pFakeStore`'s listings.
  - A fake backend file may import another feature's `data/sources` for this, with a comment saying why. App code never does (§4.2).
- **One signed-in reader.** The fake backend has one signed-in reader ("me"), the way the real server will know who is asking from the login token. JSON says what's theirs (`isMine`, `isMyDeal`, a thread's `role`); the app never compares names.
- **Live updates.** A handler may answer a `ResponseBody` stream. `/inbox/live` streams server-sent events, one `data: {...}` line per change. `InboxLiveSource` reads it through `dioProvider` with `ResponseType.stream`, and the Go backend should stream the same lines. Providers listen to `inboxChangesProvider` and reload what changed.
- Going live later = point `ApiConfig.baseUrl` at the Go service and remove the interceptor.

### 4.5 Accounts and roles (already built)

- `sessionProvider` (in `features/auth/presentation/providers/auth_providers.dart`): the current `AppUser`, or **`null` for a Guest**. Call `.notifier.signIn(email:, password:)` / `.signOut()`.
- `AppUser.role` is a `UserRole`: `reader`, `moderator`, `catalogManager`, `support`, `superAdmin`.
  - `role.isStaff`, `role.canModerate`, `role.canManageCatalog`, `role.canManageOrders`
- `isStaffProvider`: quick boolean.
- **Demo accounts** (any password): `admin@waraqah.test` (super admin), `moderator@waraqah.test`, `catalog@waraqah.test`, `support@waraqah.test`. Any other email signs in as a reader.

### 4.6 Admin area (already built)

- `/admin` is a staff-only hub listing **Admin sections** the viewer may open. It's reached from Profile.
- Sections are the `AdminSection` enum (`features/admin/domain/entities/admin_section.dart`): `dashboard` (all staff), `catalog` (catalog manager: Books, Categories, Authors, Publishers, Home's Banners, and Collections with Staff Booklists), `orders` (support), `moderation` (moderator), `tradeIn` (catalog manager: grading Sell Back books); super admin opens all. `canOpen(role)` drives both the menu and the guard.
- Catalog, Orders, Moderation and Trade-ins are real pages; only the dashboard is still a placeholder (Niloy).
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
| **Class** | School year 6–12 a Book is for. | grade, standard |
| **Exam** | SSC, HSC, university admission or BCS. | |
| **Subject** | What a textbook or guide teaches (Physics, ICT…). | |
| **Author** | The person who wrote a Book. A Book has exactly one Author for now. | writer |
| **Publisher** | The company that published a Book. A Book has exactly one Publisher. | brand, prokashoni |
| **Series** | Books meant to be read in order. May list titles Waraqah doesn't sell yet. | collection (that's a Collection) |
| **Collection** | An ordered set of Books picked by Staff, with a title and a short note on why they were picked. May belong to one Section. Not read in order (that's a Series) and not bought together (that's a Booklist). | list, shelf, bundle |
| **From-price** | Price shown before an Edition is chosen: the cheapest orderable Edition (`book.fromPriceBdt`) | lowest vendor price |
| **New arrival** | A Book recently added to Waraqah's catalog, not recently published | new release |
| **Bestseller** | A Book ranked by copies Waraqah sold in the last 30 days, all Editions together (used copies not counted) | top seller, popular |
| **Banner** | A promo tile at the top of Home, made by Staff: a title, a subtitle and one link to a Collection, Section, Book or search | ad, slider, hero |
| **Season** | A time of year Home changes for: Ramadan, Boi Mela, admission season, back to school. One at a time. | campaign, event |
| **Ayah of the Day** | A daily Quran verse on Home. Readers can turn it off. | |
| **List price** | An Edition's price before discount (`listPriceBdt`) | MRP, original price |
| **Stock / Pre-order** | Copies Waraqah can ship now / not released yet but orderable | |
| **Hidden** | A Book Staff took off the storefront: not in lists, search, Home or Collections, but its page still opens from old links. | deleted, archived |
| **Guest** | Using the app without signing in (no Role) | |
| **Reader** | A signed-in customer. Not staff. | normal user |
| **Staff** | Any account whose Role isn't Reader. Only staff open the Admin area. | admin (for the group) |
| **Admin area / Admin section** | The staff-only area / one area of work inside it | back office, module |
| **Listing** | A used book a Reader offers for sale (second-hand) | post, ad |
| **Offer** | A buyer's proposed price on a Listing (with meetup or courier), sent to the seller's inbox. Seller accepts or declines. | bid |
| **Reserved** | A Listing held for the buyer whose Offer the seller accepted. The seller can make it available again or mark it sold. | on hold, booked |
| **Inbox / Thread** | All of a Reader's conversations about used books / one buyer and one seller about one Listing. Offers and deal events land in the thread. | chat room, DM |
| **Rating** | 1–5 stars a buyer and a seller give each other after a sale. Shown on the seller page. | review (that's for Books) |
| **Wallet** | Taka a Reader holds with Waraqah: refunds and Sell Back money, spent at checkout. | credit, balance |
| **Donation** | Books a Reader pays for, delivered free to a verified place (library, school, madrasa, orphanage). | charity order |
| **Certified Used** | A used book Waraqah bought back, inspected and resells itself | refurbished |
| **Sell Back** | A Reader selling a used book to Waraqah for an instant quote | trade-in (in UI text) |
| **Expert** | A verified teacher, scholar or writer whose picks Waraqah shows. | influencer, curator |
| **Expert Pick** | A Collection made by an Expert, with their note on why. | |
| **Booklist** | Any list of books needed together: a class list, exam prep, book club or a Reader's own list. Bought together: 'Add whole list to cart'. | course list |
| **Bite** | A short post in the Book-Bites feed | tweet |

---

## 7. Who owns what

Build **only your own area**. If you need something from another area that isn't merged yet, **fake it inside your own feature folder**, using the same names and fields the owner will use, and switch to the real one when it's merged.

| Person | Area |
|---|---|
| **Rahinur** | Storefront & catalog: Section/category/author pages, search (incl. Bangla + Banglish), home feed, seasonal home, collections & Expert Picks, Booklists, Religious section, Academic browsing, design system, `core/`. **Admin:** catalog, banners, collections. |
| **Farhan** | Book page & buying new: book page (editions, formats, stock, delivery), wishlist, **cart**, checkout (bKash / Nagad / COD / card), orders & returns, "every way to buy" (new + used on one page), alerts, pre-orders, bundles, flash sales, loyalty points, Smart Basket, gift & donate, wallet; **offers & inbox (chat, arranging meetup or courier), seller profiles & ratings** (taken over from Arifin). **Admin:** orders, returns, coupons. |
| **Arifin** | Second-hand & moderation: listing flow, listing status, used marketplace, report & block, scan a book, fair price meter, Request a book, Waraqah-handled sales, Sell Back & Certified Used, "Finished it? Sell it". **Admin:** Moderation Center, trade-in grading. |
| **Niloy** | Accounts, community & AI: sign up / log in, profile & saved addresses, notifications, shelves & reading stats, Book-Bites (post, like, comment, spoilers, follow, quote cards), reviews, AI assistant. **Admin:** dashboard. |

### Shared pieces

The owner builds these and keeps their shape stable; everyone else uses them.

| Piece | Owner | Used by |
|---|---|---|
| `Book` / `Edition` models, design system, `core/` | Rahinur | everyone |
| Catalog search, collections & Booklists data | Rahinur | Niloy (AI), Farhan |
| **Add to cart** (new edition, Certified Used, reader listing) | Farhan | Rahinur, Arifin, Niloy |
| Payment method picker, wallet credit (fake backend: `WalletFakeStore.credit(amount, WalletReason.sellBack, note: title)`) | Farhan | Arifin |
| Certified Used copy and resale value for a book (catalog `UsedOptions`) | Farhan | Rahinur, Niloy |
| Readers' listings for a book (`listingsForBookProvider`), listing statuses | Arifin | Farhan, Rahinur |
| **Make an offer / message a seller** (`ref.offerOn`, `ref.openChat`), inbox badge (`InboxButton`), seller page (`P2pRoutes.sellerFor`) | Farhan | Arifin, everyone showing a listing |
| Report content (`ref.report`), create a book request, barcode scanner (`ScanButton`) | Arifin | Niloy, Rahinur |
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
- **Keep AI attribution out of the repo.** No "generated by / co-authored by AI" lines in commits or PRs, and no AI tool files other than this one.

**Avoiding conflicts**
- **ARB keys:** add yours in your own block with your prefixes:
  - Rahinur: `home`, `search`, `section`, `collection`, `expert`, `booklist`, `adminCatalog`
  - Farhan: `book`, `cart`, `checkout`, `order`, `wishlist`, `wallet`, `gift`, `adminOrder`, `offer`, `inbox`, `chat`, `seller`
  - Arifin: `listing`, `used`, `sellBack`, `scan`, `request`, `report`, `moderation` (the listing page also has `used…` keys from Farhan: check before adding one)
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

In the demo, the other person in a thread replies about 4 s after you first write, and rates you about 4 s after you mark a sale. Tests that do either must `pump(const Duration(seconds: 5))` and `settle` before they end, or the timer is still pending.

---

## 10. Known gaps (don't be surprised by these)

- The AI assistant still shows an old vendor price table. It's scheduled to use Waraqah's own catalog (Niloy). Don't copy it.
- Profile stats (books read, Bites posted, listings) are placeholder numbers.
- `.env` is still tracked in git even though `.gitignore` lists it. It holds a publishable key, not a secret; it should be removed from tracking.
- Book demand (`bookDemandProvider`) isn't shown anywhere yet: the admin dashboard (Niloy) should list it. Sellers see requests on My Listings, but nothing goes to the notification center yet.
- The fake backend has one signed-in reader, so every reader account sees the same cart, orders, wallet and inbox until the Go backend exists.
- Handled sales don't update live: pull down on a sale, or open it again, to see the other side's move. Wallet refunds show as "Refund for returned/cancelled HS-…" until the wallet has its own reason for them (Farhan).
- "Finished it? Sell it" opens from My Listings' delivered books until Niloy's shelves have a Finished shelf; then shelves call `ref.bookFinished` and the stand-in card can go.
- No push alerts while the app is closed: the inbox badge is the notification, by design for now.
- Removing a reported message, Bite or review closes the report, but the item itself stays: Bites and reviews have no backend store yet, and the inbox doesn't delete messages. Bans don't stop posting Bites or reviews yet either (Niloy, Farhan).
- Blocking hides a reader's Listings, but doesn't stop an existing inbox thread with them yet (Farhan's inbox: refuse sends to and from blocked readers).
- Bite comments don't exist yet, so nothing reports them. When they land, add `ReportIconButton(target: ReportTarget(kind: ReportTargetKind.comment, id: ...))` (Niloy).
- The P2P marketplace filter bar's text is English-only (its search field is translated now), and "Save draft" on the add-listing form doesn't save yet (Arifin's listing flow).
- Book covers are gradient seeds (`coverSeed`): there's no photo upload until the backend.
- Admin → Catalog edits (and the forced Season) live in the fake backend's memory, so they last until the app restarts.
- Bangla titles show only in Search results, not on book cards or the book page.
- Ramadan dates are seeded to 2028 (`SeasonFixtures.ramadan`); add later years before then, or let the Go backend own the calendar.
- A hidden Book can still be bought from an old link (cart, wishlist, scan). To stop sales, set its stock to 0.
- Experts are seeded (`ExpertFixtures`): there's no way to apply to be one or to manage them yet.
- Booklists can't be shared.
- Saving a Collection or Booklist that holds a hidden Book drops that Book from it (the builder only sees what the storefront shows).
- ISBN lookup answers from a fixed list (`IsbnLookupFixtures`) until the backend calls a real ISBN service.
- CSV import is paste-only: there's no file picker.
- Subjects are seeded (`SubjectFixtures`): Staff can't add or rename them yet.
