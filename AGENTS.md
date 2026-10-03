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
- **Listing flow is done** (Arifin): the add-listing form (`P2pRoutes.addListing`, signed-in only) saves through `/p2p/listings/save` (`SaveListing`, `P2pListingWriter` on the fake backend).
  - **Send for review** puts the Listing `inReview`, so it shows in the Moderation Center and on My Listings; **Save Draft** keeps it as a draft. Rules in `ListingRules`: a draft needs a title; review also needs a price (up to ৳50,000), front and back cover photos, and a damage photo when the damage flag is ticked; note up to 500 characters. The form jumps to the step that needs fixing.
  - Step 3 has five photo slots (`ListingRules.photoSlots`: front, back, spine, inside, damage), picked from the gallery (`listingPhotoPickerProvider`, overridden in tests) and sent as base64 by slot. Until there's file storage the server keeps only which slots have a photo.
  - Flags are sent as keys (`ListingRules.flags`: highlighting, notes, damage), and Step 2 has the seller's note.
  - A draft (**Edit**) or a Listing a moderator sent back (**Edit and send again**, with the reason shown) opens in the same form from My Listings (`ListingEditButton`). Saving a draft keeps a moderator's reason; sending clears it. Seed: `p2p-changes-1` (Head First Java) waits for a back cover photo.
  - The marketplace's + button starts an empty form. `openApp(..., overrides: [...])` takes provider overrides.
- **Marketplace filters are done** (Arifin): `P2pMarketplaceFilterBar` (bricks `P2pFilterMenu<T>`, providers in `p2p_filter_providers.dart`): condition; location as a division then one of its districts, from Profile's `/geo` (`geoProvider`); a Section then one of its catalog Categories (`sectionCategoriesProvider`); price. Every label comes from the ARB files (`usedFilter…`), places and Categories in Bangla when the app is. Listings now carry `categoryId` and `section` instead of free-text `category`: the fake backend fills them in from the Listing's catalog Book when it has none (`withCatalogCategory`), and the listing page shows the Category.
- **Request a book is done** (Arifin): `features/book_request`.
  - `BookRequestRoutes.newFor(title:, bookId:)` (`/request-book`) is the form: title, author, most you'd pay, note (`RequestRules`). Guests log in to send. Search's "Request this book" and the scanner's "not found" open it (the catalog's stand-in page is gone).
  - Sending tells the readers who have the book: the answer says how many (`notifiedSellers`) and how many copies are on sale now (`matchCount`). A Listing matches by catalog Book or by title words (`RequestRules.matches`).
  - **My book requests** (`BookRequestRoutes.requests`, signed-in only, linked from Profile): See copies (the marketplace searching for it) or Close.
  - Sellers see **Readers want your books** on My Listings (`wantedBooksProvider`).
  - Demand for admins: `bookDemandProvider` (titles, most asked first); the Admin dashboard lists it.
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
  - The shelves call it when a book moves to Finished.
- **Shelves are done** (Arifin): `features/shelves`, `ShelvesRoutes.shelves` (`/shelves`, signed-in only, `ShelvesLink` on Profile).
  - Want to Read, Reading and Finished (`Shelf`), one at a time on the page; each Book's ⋮ menu moves it or takes it off.
  - On the book page (under the summary), `ShelfButton(bookId:)` says "Add to shelf" or the shelf it's on, and opens the shelf sheet. Elsewhere: `ref.moveToShelf(context, bookId, shelf)` (guests log in first); `shelfOfProvider(bookId)`, `finishedCountProvider`.
  - Moving a Book to Finished calls `ref.bookFinished`, so "Finished it? Sell it" now starts there; My Listings' stand-in card (and `boughtBooksProvider`) is gone. Profile's "Books read" counts the Finished shelf.
  - Fake API `/shelves`, `/shelves/move` (`ShelfFakeStore`, sharing `OrderFakeStore`): each Book from a delivered order (not a gift or Donation) goes on Want to Read once; removing it doesn't bring it back. Seeds: The Hobbit (Reading), The Alchemist and Sherlock Holmes (Finished), Clean Code (Want to Read).
- **Reading progress and stats are done** (Arifin, in `features/shelves`):
  - A Book on Reading shows how far the reader got (`ShelfProgressRow`); **Update** asks for a percentage or the page of the Book's total (`ProgressRules`: 0–100%, pages up to 5,000). Updating a Want to Read Book puts it on Reading; 100% finishes it and offers the finished prompt.
  - **Reading stats** (`ShelvesRoutes.stats`, the chart icon on the shelves page): the yearly goal (1–365 Books, Set / Change goal), the reading streak (days in a row with progress, counted up to today or yesterday), Books finished each month this year and the top 3 Categories.
  - The finished prompt ("Finished …?", `FinishedItChoices`) now starts with **Write a review** and **Post a Bite** for the Book, then the ways to sell it.
  - Fake API `/shelves/progress`, `/reading/stats`, `/reading/goal` (`ReadingLog` keeps the reading days and goal; seeds a 3-day streak, a goal of 12 and four Books finished this year).
- **Admin dashboard is done** (Arifin): `AdminDashboardPage` at `AdminRoutes.section(AdminSection.dashboard)` (all Staff; the placeholder `AdminSectionPage` is gone).
  - Tiles: orders and sales today, orders not shipped yet, Listings to approve, open reports, open disputes. Each opens Orders or the Moderation Center when the viewer's role may (`DashboardStatsGrid`).
  - Lists: top searches and most requested books (the same demand as `bookDemandProvider`).
  - Fake API `/admin/dashboard` (`DashboardFakeStore`, reading the orders, P2P, moderation, handled-sale and request stores). Searches are counted by `SearchLog`, which wraps the catalog's `/books` in `fake_api_routes.dart`: live search's growing terms ("sap" → "sapiens") count once, and Staff's `includeHidden` list isn't counted. Seeded with five terms.
- **Accounts are done** (Niloy #108, Rahinur): sign-up with a one-time code (OTP), log in, Continue with Google and password reset, all through Auth's fake API (`/auth/...`). Sign-up keeps the name; the demo OTP is `123456` (`AuthFixtures.demoOtp`), any other code is refused.
- **Profile and settings are done** (Rahinur): `ProfileRoutes.edit|addresses|settings` (signed-in only); `/profile`, `/profile/prefs`, `/addresses…`, `/geo`. Edit profile saves name, BD mobile and photo (`ProfileRules`) and renames the session (`SessionNotifier.rename`). Saved addresses (`SavedAddress`, `addressesProvider` in `features/profile`) are the ones checkout uses; the default is preselected, and checkout's "Add a new address" opens `ProfileRoutes.addressesAdd`. Division → district → upazila pickers read `/geo` (`geoProvider`). Settings: one switch per notification group (`ProfilePrefs.muted`), two privacy switches (saved for Bites and reading life), delete account. Theme, language and the Ayah switch stay on the Profile tab (device settings).
- **Notifications are done** (Rahinur): `features/notifications`, `NotificationsRoutes.center` (`/notifications`, signed-in only), `NotificationBell` (Home's top bar + Profile), live via `/notifications/live`. Fake backends send with `NotificationFakeStore.send(readerId, kind, params:, target:)`, or the one-line helpers in `NotificationSends` / `NotificationSaleSends`; the text comes from ARB per kind (`notificationText`), and a target opens its page (`notificationRoute`). Senders today: order status and returns, Listing decisions, warnings and bans, handled sales, Sell Back, price and stock alerts (`AlertFakeStore.sweep`, run by `CatalogAdminFakeStore.onChanged`), book requests. A muted group is dropped; moderation can't be muted. Offers and messages stay in the inbox.
- **Bites are done** (Rahinur): `features/bites`. Routes: the tab, `BitesRoutes.compose` / `composeFor(id:, bookId:)` (signed-in only), `detailFor(id)`, `forBook(id)`, `quote` / `quoteFor(text:, bookId:)`. Fake API `/bites?feed=forYou|following&bookId=&authorId=` (30 newest), `/bites/detail`, `/bites/post|edit|delete|like`, `/bites/comments/post|delete` (`BiteFakeStore`, seeded by `BiteFixtures`). `BiteRules`: 500 graphemes per Bite, 300 per comment, a spoiler needs a Book tag. For You and Following tabs, a full-page composer with catalog autocomplete for the tag, spoilers blurred until tapped, like, share (copies a link), comments with one level of replies. Feeds leave out blocked and banned readers; a banned Reader can't post or comment. Home's strip reads For You (`biteFeedProvider`).
- **Reviews are done** (Rahinur): `features/reviews`, `ReviewsRoutes.forBook(id)`; fake API `/reviews?bookId=`, `/reviews/save`, `/reviews/delete` (`ReviewFakeStore`). One review per Reader per Book (`ReviewRules`: 1–5 stars, text up to 1000). The book page shows `BookReviewsPanel` and `BookBitesPanel` (in `features/bites`). Verified Purchase = "me" has a delivered, non-donation order line for the Book. Saving or deleting sets the Book's `rating` to the reviews' average.
- **Readers and follow are done** (Rahinur): `features/readers`, `ReadersRoutes.readerFor(id)` (`me` for your own page); fake API `/readers/detail`, `/readers/follow` (`FollowFakeStore`). The Reader page respects "profile visible" (a private one shows only the name and Follow). Bite authors, commenters, reviewers, the seller page ("See their Bites") and the Profile header open it. Profile's "Bites posted" and "Listings" come from `/readers/detail?id=me`. Follows, comments and replies send `newFollower`, `biteComment` and `commentReply` notifications (Community group).
- **Quote cards are done** (Rahinur): `/bites/quote` turns a quote (and an optional Book) into a 4:5 card in four styles and shares it as a PNG with `share_plus` (`quoteSharerProvider`). Opens from the Bites tab and any Bite's menu.
- **AI assistant on our catalog is done** (Arifin, from Niloy's start): `features/ai_assistant`, `AiAssistantRoutes.aiChat`.
  - Answers come from the fake API: `/assistant/greeting?lang=` and `/assistant/ask` (`{prompt, history, lang}` → `{id, text, bookIds}`), answered by `AssistantBrain`: it detects the request (`AssistantIntent`), picks up to four catalog Books on the storefront within the budget (`assistantBooksFor`), and words the reply in English or Bangla (`AssistantReplies`, server-side text). The app sends the app's language.
  - Each recommended Book shows as a card with Waraqah's From-price and stock (`RecommendationCard`); there are no vendors or price tables any more (`VendorQuote` is gone). The prompt chips come from the ARB files.
  - Built with `--dart-define=GEMINI_API_KEY=...`, Gemini words the answer around the same Books; if it fails, the API's reply stands.
- **Smarter AI is done** (Arifin): `AssistantParser` reads plain English, Banglish or Bangla (Bangla digits, "1,000", "১০০০ টাকার মধ্যে"): a topic, a budget, Class (6–12), Exam, language and format. "Short seerah for beginners in Bangla" finds Books with a Bangla Edition; "Books for Class 9 under ৳1,000" is a **basket**: the cheapest orderable Edition of each fitting Book, added while the total stays in budget (up to eight), sent as `basket: {editionIds, totalBdt}`. The reply shows `BasketCard` with **Add all to cart** (Farhan's cart, one Edition each). Two new prompt chips try both; Bangla replies use Bangla digits.
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
| Sharing | `share_plus` (quote card images) |
| Text | `characters` (Bite lengths in graphemes) |
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
│   ├── finished_it/  handled_sale/  sell_back/  notifications/
│   ├── deals/  donate/  home/  inbox/  loyalty/  moderation/  orders/  p2p/  profile/  readers/  report/  reviews/  scan/
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
- **Shared fake stores.** Stores that several features change are created once in `app/fake_stores.dart` (`FakeStores`) and passed to each feature's `routes(...)` in `fake_api_routes.dart`. Tests can pass their own: `FakeApiRoutes.interceptor(stores)`. For example:
  - checkout, orders and the wallet share `OrderFakeStore` and `WalletFakeStore`;
  - the inbox reserves and sells `P2pFakeStore`'s listings;
  - checkout's `/orders/place` delivers to Profile's `AddressFakeStore`;
  - orders, moderation, handled sales, Sell Back, alerts (`AlertFakeStore`), book requests, Bites and follows send to `NotificationFakeStore`;
  - moderation deletes removed Bites, comments and reviews in `BiteFakeStore` and `ReviewFakeStore`.
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
- Every section is a real page: Dashboard, Catalog, Orders, Moderation and Trade-ins.
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
| **Spoiler** | A Bite blurred until tapped; it must tag the Book it spoils. | |
| **Quote card** | A quote from a Book rendered as an image to share. | |
| **Review** | A Reader's 1–5 stars and optional text on a Book, one per Book. | rating (that's for buyers and sellers) |
| **Verified Purchase** | The Reader got this Book delivered from Waraqah. | |
| **Reader page** | A Reader's public page: area, Bites, followers. The seller page is the same person's used-book side. | profile (that's your own settings) |
| **Follow** | Seeing a Reader's Bites in your Following feed. | friend, subscribe |
| **Saved address** | A delivery address in the Reader's profile (label, recipient, phone, division → district → upazila). One is the default. | shipping profile |
| **Notification** | A note in the notification center that something happened to the Reader (order, Listing, sale, alert…). Not offers or messages: those are the inbox. | push, alert (that's a price or stock alert) |

---

## 7. Who owns what

Build **only your own area**. If you need something from another area that isn't merged yet, **fake it inside your own feature folder**, using the same names and fields the owner will use, and switch to the real one when it's merged.

| Person | Area |
|---|---|
| **Rahinur** | Storefront & catalog: Section/category/author pages, search (incl. Bangla + Banglish), home feed, seasonal home, collections & Expert Picks, Booklists, Religious section, Academic browsing, design system, `core/`. Accounts & community (taken over from Niloy): sign up / log in, profile & saved addresses, notifications, Book-Bites (post, like, comment, spoilers, follow, quote cards), reviews. **Admin:** catalog, banners, collections. |
| **Farhan** | Book page & buying new: book page (editions, formats, stock, delivery), wishlist, **cart**, checkout (bKash / Nagad / COD / card), orders & returns, "every way to buy" (new + used on one page), alerts, pre-orders, bundles, flash sales, loyalty points, Smart Basket, gift & donate, wallet; **offers & inbox (chat, arranging meetup or courier), seller profiles & ratings** (taken over from Arifin). **Admin:** orders, returns, coupons. |
| **Arifin** | Second-hand & moderation: listing flow, listing status, used marketplace, report & block, scan a book, fair price meter, Request a book, Waraqah-handled sales, Sell Back & Certified Used, "Finished it? Sell it". **Admin:** Moderation Center, trade-in grading. **Finishing the front end** (taken over from the others, see below). |

### Arifin: finishing the front end

Everything below is still missing. Arifin builds it, one branch per item, inside the owning feature's folder (other owners' code is touched only where the item needs it, and the PR says so).

1. ~~**Listing flow, for real:**~~ done (see §2): the add-listing form sends the Listing to the fake API (`inReview`, so it reaches the Moderation Center and My Listings); "Save draft" saves it; Step 3 takes photos (front cover, back cover, spine, one inside page, any damage); a Listing with Changes requested or Rejected can be edited and sent again.
2. ~~**Marketplace filters:**~~ done (see §2): location from `/geo` (division → district), Category from the catalog, all text from the ARB files.
3. ~~**Shelves**~~ done (see §2): (taken over from Niloy / Rahinur): Want to Read / Reading / Finished; delivered order Books are added automatically; moving a Book to Finished calls `ref.bookFinished`, and My Listings' stand-in card goes; Profile's "Books read" counts the Finished shelf.
4. ~~**Reading progress and stats:**~~ done (see §2): pages or % read, a yearly goal, a reading streak; a stats page (Books per month, favourite Categories); on finishing, offer to write a Review, post a Bite or sell it.
5. ~~**AI assistant on our catalog:**~~ done (see §2): remove `VendorQuote` and the vendor price table; answers show Waraqah's own From-price and stock.
6. ~~**Smarter AI:**~~ done (see §2): "Books for Class 9 under ৳1,000" builds a basket from the catalog and adds it to the cart; plain-words search ("short seerah for beginners in Bangla") maps to `CatalogFilters`.
7. ~~**Admin dashboard:**~~ done (see §2): today's orders and sales, Listings waiting for approval, top searched Books (search terms logged by the fake backend), most requested Books (`bookDemandProvider`).
8. **Blocking in the inbox:** the server refuses sends to and from a blocked reader; the thread says so.
9. **Removed messages:** a message a moderator removes leaves the thread.
10. **Live handled sales:** a sale's page updates when the other side moves.
11. **Wallet refund reason:** handled-sale refunds get their own `WalletReason`.
12. **Bangla titles** on book cards and the book page.
13. **Admin: donation places:** staff add, edit and remove the verified places Donations go to.

### Shared pieces

The owner builds these and keeps their shape stable; everyone else uses them.

| Piece | Owner | Used by |
|---|---|---|
| `Book` / `Edition` models, design system, `core/` | Rahinur | everyone |
| Catalog search, collections & Booklists data | Rahinur | Arifin (AI), Farhan |
| **Add to cart** (new edition, Certified Used, reader listing) | Farhan | Rahinur, Arifin |
| Payment method picker, wallet credit (fake backend: `WalletFakeStore.credit(amount, WalletReason.sellBack, note: title)`) | Farhan | Arifin |
| Certified Used copy and resale value for a book (catalog `UsedOptions`) | Farhan | Rahinur, Arifin |
| Readers' listings for a book (`listingsForBookProvider`), listing statuses | Arifin | Farhan, Rahinur |
| **Make an offer / message a seller** (`ref.offerOn`, `ref.openChat`), inbox badge (`InboxButton`), seller page (`P2pRoutes.sellerFor`) | Farhan | Arifin, everyone showing a listing |
| Report content (`ref.report`), create a book request, barcode scanner (`ScanButton`) | Arifin | Rahinur |
| `sessionProvider` & roles | (built) | everyone |
| Saved addresses (`addressesProvider` / `SavedAddress` in `features/profile`) | Rahinur | Farhan (checkout) |
| Send a notification (fake backend: `NotificationFakeStore.send`) | Rahinur | Farhan, Arifin, everyone |
| "Book finished" event (shelves) | Arifin | Arifin |
| Reviews and "Bites about this book" widgets: done (`BookReviewsPanel`, `BookBitesPanel`) | Rahinur | Farhan (book page) |

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
  - Rahinur: `home`, `search`, `section`, `collection`, `expert`, `booklist`, `adminCatalog`, and (taken over from Niloy) `auth`, `profile`, `notification`, `bite`, `review`, `reader`, `quote`. Teammates merge Rahinur's PRs for this area too.
  - Farhan: `book`, `cart`, `checkout`, `order`, `wishlist`, `wallet`, `gift`, `adminOrder`, `offer`, `inbox`, `chat`, `seller`
  - Arifin: `listing`, `used`, `sellBack`, `scan`, `request`, `report`, `moderation`, and (taken over) `shelf`, `reading`, `ai`, `adminDashboard`, `adminDonate` (the listing page also has `used…` keys from Farhan: check before adding one)
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

- `.env` is still tracked in git even though `.gitignore` lists it. It holds a publishable key, not a secret; it should be removed from tracking.
- The fake backend has one signed-in reader, so every reader account sees the same cart, orders, wallet and inbox until the Go backend exists.
- Handled sales don't update live: pull down on a sale, or open it again, to see the other side's move. Wallet refunds show as "Refund for returned/cancelled HS-…" until the wallet has its own reason for them (Arifin).
- No push notifications while the app is closed: the notification center and the inbox badge update only while the app is open.
- Deleting an account signs out but can't wipe the shared demo data (one "me" on the fake backend).
- Upazila names are English only (divisions and districts have Bangla).
- Removing a reported message closes the report, but the message stays: the inbox doesn't delete messages (Arifin).
- Blocking hides a reader's Listings, but doesn't stop an existing inbox thread with them yet (Arifin, in Farhan's inbox: refuse sends to and from blocked readers).
- Listing photos aren't stored or shown yet: the fake backend keeps only which slots have a photo, and moderators see named tiles.
- Book covers are gradient seeds (`coverSeed`): there's no photo upload until the backend.
- Admin → Catalog edits (and the forced Season) live in the fake backend's memory, so they last until the app restarts.
- Bangla titles show only in Search results, not on book cards or the book page (Arifin).
- Ramadan dates are seeded to 2028 (`SeasonFixtures.ramadan`); add later years before then, or let the Go backend own the calendar.
- A hidden Book can still be bought from an old link (cart, wishlist, scan). To stop sales, set its stock to 0.
- Experts are seeded (`ExpertFixtures`): there's no way to apply to be one or to manage them yet.
- Booklists can't be shared.
- Saving a Collection or Booklist that holds a hidden Book drops that Book from it (the builder only sees what the storefront shows).
- ISBN lookup answers from a fixed list (`IsbnLookupFixtures`) until the backend calls a real ISBN service.
- CSV import is paste-only: there's no file picker.
- Subjects are seeded (`SubjectFixtures`): Staff can't add or rename them yet.
- Bite feeds show the 30 newest; no paging yet.
- Nobody else likes or comments on your Bites in the demo; community notifications are seeded.
