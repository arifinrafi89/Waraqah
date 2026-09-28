# Home Page Refinement Plan

Branch: `cards29/home-page-refinement`. Do all work on this branch. Do not create branches.
Decided: 2026-09-29, in a grilling session with the project owner. Every decision below is final.
Spec: https://github.com/arifinrafi89/Waraqah/issues/34 (`ready-for-agent`).

## Context for a fresh session

Waraqah is a Flutter course project. The goal is good UI. **There is no backend and there never will be in this course**: all data is dummy data from fixtures. A teacher reviewed the app and gave the feedback below. This plan answers every point.

| # | Teacher feedback | Where it is handled |
|---|---|---|
| T1 | Use only Riverpod for controllers (why provider, riverpod, etc.) | Issue 2 |
| T2 | Use providers for everything, not controllers | Issue 2 |
| T3 | `lib/features/home`: no `sections/`, keep everything in `widgets/` | Issue 4 |
| T4 | Check the need for entities in `home/domain`; why no model? Models belong in the data layer | Issue 4 |
| T5 | One screen per feature | Home already has one screen. Other features are out of scope. |
| T6 | Use case boilerplate | Issue 4 |
| T7 | Set these instructions as strict rules for the agent | Issue 1 |
| T8 | Cards look too big; use aspect ratio, not height/width | Issue 6 |
| T9 | `lib/core/network`: fix Dio properly | Issue 5 |
| T10 | See the use case of the notifier | Issues 2 and 4 |
| T11 | Add models in the data layer (entities + models) | Issue 4 |
| T12 | l10n: more dynamic ways | **Deferred by the owner.** Only plain ARB keys for new or hard-coded strings. |
| T13 | Improve the UI: more futuristic, polished, advanced | Issues 7, 8 and 9 |

### Scope

- Main target: the home feature, plus the app-wide changes the decisions below require.
- Allowed outside home: `app/`, `core/`, `profile_page.dart` (settings only), catalog seed data and `book_remote_source.dart`, `BiteCard` / `P2pCard` and their skeletons, `p2p_marketplace_grid.dart`, ARB files.
- Out of scope: other features' extra screens (p2p's 3 pages, `catalog_results_list.dart` and `chat_transcript.dart` in `pages/`), splitting `Book` into entity + model, dynamic l10n (ICU plurals, localized data maps, Bangla digits).

### Rules for every issue

- Read `CLAUDE.md` and `CONTEXT.md` first. Follow the project conventions there (120-line file limit, `AppPalette` colours, `Insets`, `AppFonts`, `AsyncView` + shimmer skeleton, ARB strings in both `app_en.arb` and `app_bn.arb`).
- `CLAUDE.md`, `CONTEXT.md` and `docs/agents/` are tracked in git (since commit `b3cb804`). Commit edits to them like any other file. Stage files by explicit path, never `git add -A` or `git add .`.
- One commit per issue, on this branch. Do not open a PR; the owner does that.
- Before each commit: `flutter analyze` is clean and `flutter test` passes.
- After editing a `@freezed` class or an ARB file, run codegen (`dart run build_runner build --delete-conflicting-outputs` or `flutter pub get`) and commit the generated files.
- No new packages unless an issue says so.
- Tests use two seams only (spec: issue #34). **Seam 1:** a `ProviderContainer` with mock `SharedPreferences` and the real `dioProvider` + `FakeApiInterceptor` + fixture routes, with fake time; tests read providers. **Seam 2 (nav only):** a widget test of router + shell in `ProviderScope`, with `debugDefaultTargetPlatformOverride` and `GoogleFonts.config.allowRuntimeFetching = false`. No lower-level unit tests of use cases, repositories or route handlers. Tests live in `test/widget_test.dart` (76 lines today). If it would pass 120 lines, split it into `test/<area>_test.dart` files.

### GitHub tickets

Each plan issue is a sub-issue of #34, with native blocking edges. Plan issue 9 is split in two.

**Implementation order:** #45 → #35 → #36 → #37 → #38 → #39 → #40 → #41 → #42 → #43 → #44.

| Plan issue | GitHub | Blocked by |
|---|---|---|
| 1 Rules in CLAUDE.md | #45 | none |
| 2 Riverpod settings | #35 | none |
| 3 Seed data | #36 | none |
| 4 Home structure | #37 | none |
| 5 Dio fake API | #38 | #37 |
| 6 Aspect-ratio cards | #39 | #37 |
| 7 Nav rail | #40 | none |
| 8 Info icon | #41 | #37 |
| 9 items 1, 2, 6, 7: sliver layout | #42 | #37, #39, #40, #41 |
| 9 items 3, 4, 5: motion polish | #43 | #42 |
| 10 Final check | #44 | all |

Issue 1 rewrites the data-flow and offline-fallback bullets of `CLAUDE.md` only after issue 5; issue 5 (#38) owns that rewrite.

### Dependency order

```
1 (rules) ─┐
2 (Riverpod settings + app bar strings)
3 (seed data)
4 (home structure) ──> 5 (Dio fake API)
                  ├──> 6 (aspect-ratio cards)
                  └──> 8 (non-beneficial info icon)
7 (nav rail)
9 (UI polish) needs 4, 6, 7, 8
10 (final check) needs all
```

Issues 1, 2, 3, 4 and 7 can start in any order.

---

## Issue 1: Write the teacher's rules into CLAUDE.md

Add a section `## Strict rules (teacher review)` near the top of `CLAUDE.md`. Every future agent must follow it. Content:

1. Riverpod is the only state library. No `provider` package, no `ChangeNotifier`, no `*Controller` classes. Expose all state as Riverpod providers (`Provider`, `FutureProvider`, `NotifierProvider`).
2. Use a `Notifier` only when state has real actions (for example `toggleTheme()`). For a trivial one-value UI choice, use `selectionProvider<T>` from `core/state/selection_notifier.dart`.
3. Each feature has `domain/entities/` (pure classes, no JSON) and `data/models/` (JSON, with `toEntity()`). Repository implementations return entities.
4. Each feature has `domain/usecases/`. A use case extends `UseCase<Result, Params>` from `core/usecase/usecase.dart`. Providers call use cases, never repositories directly.
5. One screen per feature. A part that is not an independent screen is a widget in `presentation/widgets/`. No `sections/` folders.
6. Size cards with `AspectRatio` / `childAspectRatio` and max-extent grids. No fixed card widths or heights.
7. All data goes through `dioProvider`. There is no backend: `FakeApiInterceptor` answers from fixtures. Remote sources never catch `DioException` to fall back to fixtures.

Then fix the lines that now contradict these rules:

- "Two state systems, deliberately split" → Riverpod only; settings live in `settingsProvider`.
- The data-flow and offline-fallback bullets → describe `FakeApiInterceptor` (after issue 5).
- The `selectionProvider` bullet → keep, and point to rule 2.

**Done when:** `CLAUDE.md` has the section, no line contradicts it, and the change is committed.

---

## Issue 2: Riverpod only for settings; app bar strings to ARB

Handles T1, T2, T10.

**Today:** `core/settings/settings_controller.dart` is a `ChangeNotifier` exposed with the `provider` package. It is used by `app/app_bootstrap.dart`, `app/app.dart`, `features/home/presentation/widgets/home_app_bar.dart` and `features/profile/presentation/pages/profile_page.dart`. `core/settings/settings_store.dart` wraps `SharedPreferences`.

**Do:**

1. Add a `sharedPreferencesProvider` (`Provider<SharedPreferences>` that throws if not overridden). In `AppBootstrap.start()`, await `SharedPreferences.getInstance()` and pass `ProviderScope(overrides: [sharedPreferencesProvider.overrideWithValue(prefs)])`.
2. Replace `SettingsController` with `SettingsNotifier extends Notifier<AppSettings>` and `settingsProvider`. `AppSettings` holds `ThemeMode themeMode` and `Locale? locale` (null = follow device). Methods: `setThemeMode`, `setLocale`, `toggleBrightness(Brightness current)`. Each updates `state` and saves through `SettingsStore`. Keep `SettingsStore` as-is (it gets `SharedPreferences` from the provider). Delete `settings_controller.dart`.
3. `WaraqahApp` becomes a `ConsumerWidget` and reads `ref.watch(settingsProvider)`.
4. Update `HomeAppBar` and `ProfilePage` to `ref.watch` / `ref.read(settingsProvider.notifier)`.
5. Remove `provider` from `pubspec.yaml`. `grep -rn "package:provider" lib test` must return nothing.
6. `HomeAppBar` has hard-coded tooltips `'Light mode'`, `'Dark mode'`, `'English'`, `'বাংলা'`. Move them to ARB keys in both files.
7. Update the stale comments in `settings_store.dart` that mention `SettingsController`.

**Test (seam 1):** through a `ProviderContainer`, `settingsProvider` changes theme mode and locale, and a fresh container reads the saved values back.

**Done when:** theme toggle and language toggle work from the home app bar and from Profile, and survive an app restart.

---

## Issue 3: Catalog seed data follows the Benefit tag rule

See **Benefit tag**, **Beneficial**, **Non-beneficial** in `CONTEXT.md`. The tag is admin-curated. The owner's rule for dummy data: Islamic, science and coding books are Beneficial; fiction and the titles below are Non-beneficial.

Files: `lib/features/catalog/data/sources/seed/`. Today: `general_shelf.dart` (77 lines) and `islamic_shelf.dart` (48 lines), aggregated in `book_fixtures.dart`. Keep each file under 120 lines, so add new shelf files (for example `classical_shelf.dart`, `fiction_shelf.dart`) and list them in `BookFixtures.all`.

**Final book set:**

| Title | Author | Category | Beneficial | Change |
|---|---|---|---|---|
| Fiqh us-Sunnah, Vol. 1 | Sayyid Sabiq | Islamic Studies | yes | keep |
| The Sealed Nectar | (keep existing) | Islamic Studies | yes | keep |
| Riyad as-Salihin | (keep existing) | Islamic Studies | yes | keep |
| Clean Code | (keep existing) | Academic | yes | keep |
| Calculus: Early Transcendentals | (keep existing) | Academic | yes | **retag to true** |
| Tafsir Ibn Kathir | Ibn Kathir | Islamic Studies | yes | add |
| Al-Bidayah wan-Nihayah | Ibn Kathir | Islamic Studies | yes | add |
| Sahih al-Bukhari | Imam al-Bukhari | Islamic Studies | yes | add |
| Al-Adab al-Mufrad | Imam al-Bukhari | Islamic Studies | yes | add |
| Ihya Ulum al-Din | Imam al-Ghazali | Islamic Studies | yes | add |
| Madarij as-Salikin | Ibn Qayyim al-Jawziyya | Islamic Studies | yes | add |
| Al-Muqaddimah | Ibn Khaldun | Islamic Studies | yes | add |
| Sapiens: A Brief History of Humankind | Yuval Noah Harari | Academic | **no** | **retag to false** |
| Atomic Habits | James Clear | Self-Help | **no** | **retag to false** |
| Zero to One | Peter Thiel | Business | no | keep |
| The Hobbit | J. R. R. Tolkien | Fiction | no | add |
| Harry Potter and the Philosopher's Stone | J. K. Rowling | Fiction | no | add |
| The Da Vinci Code | Dan Brown | Fiction | no | add |
| Sherlock Holmes: A Study in Scarlet | Arthur Conan Doyle | Fiction | no | add |

Do not question the owner's tags for Atomic Habits and Zero to One. For new books, invent realistic dummy values in the same style as the existing seed: unique `id` (`bk-...`), `priceBdt` between 250 and 1800, a Bangladeshi vendor (Wafilife, Rokomari, Boi Bazar, ...), `vendorCount`, `rating` 4.0–4.9, `tags: [category]`, `coverSeed` spread across values, `shortTitle` when the title is long, some with `originalPriceBdt` (discount). Existing category names are fixed by `catalog_categories.dart`: use only `Islamic Studies`, `Academic`, `Fiction`, `Self-Help`, `Business`.

**Done when:** the catalog tab and the home **Benefit filter** show the new books with the right tags.

---

## Issue 4: Home structure (widgets, entity + model, use cases)

Handles T3, T4, T6, T10, T11.

**Today:** `features/home/` has `domain/entities/ayah.dart` (freezed + JSON: entity and model in one), `domain/repositories/ayah_repository.dart`, `data/sources/ayah_fixtures.dart`, `data/repositories/ayah_repository_impl.dart` (fixtures + 600 ms delay + `TtlCache`), `presentation/providers/home_providers.dart`, `presentation/sections/` (5 files) and `presentation/widgets/`.

**Do:**

1. **Sections → widgets.** Move the 5 files in `presentation/sections/` to `presentation/widgets/`. Delete `sections/`. Fix imports.
2. **Entity + model.**
   - `domain/entities/ayah.dart`: freezed, **no** `fromJson` / `toJson`. Keep the `reference(...)` extension here.
   - `data/models/ayah_model.dart`: freezed with `fromJson` / `toJson` and `Ayah toEntity()`.
   - `ayah_fixtures.dart` holds `AyahModel`s (or JSON maps, see issue 5).
   - `AyahRepositoryImpl` works with `AyahModel` internally and returns `Ayah`.
3. **Use case base.** `lib/core/usecase/usecase.dart`:
   ```dart
   abstract interface class UseCase<Result, Params> {
     Future<Result> call(Params params);
   }

   final class NoParams {
     const NoParams();
   }
   ```
4. **Home use cases** in `domain/usecases/`:
   - `GetAyahOfTheDay extends UseCase<Ayah, NoParams>` calls `AyahRepository.fetchAyahOfTheDay()`.
   - `GetNewArrivals extends UseCase<List<Book>, BenefitFilter>` takes the catalog's `BookRepository` (public interface, via `bookRepositoryProvider`). It calls `searchCatalog()` (the full list), applies the filter, then takes up to 8. This fixes today's bug: `fetchNewArrivals()` returns only 4 books and home filters those 4, so a filter can show 0–1 books. Keep the catalog's sort (cheapest first, ties by higher rating).
   - Move the `BenefitFilter` enum to `domain/` (it is domain vocabulary, see `CONTEXT.md`).
5. **Providers.** `home_providers.dart`: `getAyahOfTheDayProvider`, `getNewArrivalsProvider` (use cases), `ayahOfTheDayProvider` and `homeNewArrivalsProvider` call the use cases. Keep `benefitFilterProvider = selectionProvider<BenefitFilter>(BenefitFilter.all)`.
6. Home keeps reading `biteFeedProvider` (bites) and `nearbyListingsProvider` (p2p) directly. Do not add use cases to those features.

**Test (seam 1):** through a `ProviderContainer`, `homeNewArrivalsProvider` for each `BenefitFilter` value returns only matching books, at most 8, cheapest first. (Until issue 5 lands, override `bookRepositoryProvider` if needed; switch to the real fake API after issue 5.)

**Done when:** no `sections/` folder, no JSON in `home/domain/`, and no provider in home calls a repository method directly.

---

## Issue 5: Dio with a fake API interceptor

Handles T9. Needs issue 4 (the `AyahModel`).

**Today:** `core/network/dio_client.dart` has an unused `authToken` parameter and no logging or error handling. `api_config.dart` points at `http://10.0.2.2:8080/api/v1` (Android emulator only), so on web every call fails. Only `catalog/data/sources/book_remote_source.dart` uses Dio; it catches `DioException` and falls back to fixtures after 900 ms. The Ayah data does not use Dio at all.

**Do:**

1. `DioClient.create`: remove `authToken`. Add `LogInterceptor` only when `kDebugMode`. Add an error interceptor that turns `DioException` into a small `ApiException` (message + status code) in `core/network/api_exception.dart`.
2. `core/network/fake_api_interceptor.dart`: a generic interceptor. Constructor takes a route table, for example `Map<String, Object? Function(RequestOptions)>` keyed by path. `onRequest`: if the path is in the table, wait ~900 ms (so the shimmer skeletons show), then `handler.resolve(Response(data: ..., statusCode: 200))`. Unknown path → reject with 404. `core/` must not import any feature.
3. Wire the route table in the composition root, for example `lib/app/fake_api_routes.dart`, which may import feature fixtures:
   - `ApiRoutes.books` → `BookFixtures.all` as JSON, filtered by the `category` and `q` query parameters. Move the filter logic from `BookRemoteSource._fallback` here.
   - `ApiRoutes.ayahOfTheDay` → today's Ayah as JSON (`AyahFixtures.forDate(DateTime.now())`).
   - Override `dioProvider` in `AppBootstrap` (or build it with the routes) so the fake interceptor is always on.
4. `BookRemoteSource`: delete the `try/catch` and `_fallback`. Just call Dio.
5. Home: add `data/sources/ayah_remote_source.dart` (`GET ApiRoutes.ayahOfTheDay` → `AyahModel.fromJson`). `AyahRepositoryImpl` uses it, keeps the 24 h `TtlCache`, and drops its own `Future.delayed`. `ayahRepositoryProvider` injects `dioProvider`.
6. Set `ApiConfig.baseUrl` to a neutral placeholder and update its doc comment: requests never leave the app while `FakeApiInterceptor` is installed. Going live later = remove the interceptor.
7. Bites, p2p and AI keep their fixtures-only repositories (out of scope).

**Test (seam 1):** through a `ProviderContainer` with the real fake API, catalog search honours category and query, and `ayahOfTheDayProvider` loads today's Ayah.

**Done when:** the web build loads home and catalog without waiting for a network timeout; `grep -rn "DioException" lib/features` returns nothing.

---

## Issue 6: Cards sized by aspect ratio

Handles T8. Needs issue 4 (widget paths).

**Today:** `home/presentation/widgets/book_grid.dart` uses a `LayoutBuilder` + `_Wrap` that always makes 2 columns, so on a desktop browser each card is huge. `p2p/presentation/widgets/p2p_marketplace_grid.dart` uses `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7)`, same problem. `BiteCard`, `P2pCard`, `bite_strip_skeleton.dart` and `p2p_strip_skeleton.dart` set fixed widths from `Sizes.biteCardWidth` (196) and `Sizes.p2pCardWidth` (150).

**Do:**

1. Home new-books grid and its skeleton: `SliverGridDelegateWithMaxCrossAxisExtent` (max extent about 180, tune by eye) + `childAspectRatio`. Phone → 2 columns, desktop → 5–6.
2. `p2p_marketplace_grid.dart`: same delegate type; keep `childAspectRatio: 0.7`.
3. `BiteCard`, `P2pCard` and both strip skeletons: remove the fixed width. The card fills its parent width and gets its height from `AspectRatio`. The home horizontal strip decides the card width as a fraction of the viewport width, clamped between a min and max so it looks right on phone and desktop.
4. Delete `Sizes.biteCardWidth` and `Sizes.p2pCardWidth`.
5. Check that the Bites tab and the P2P tab still look right, because these cards are also used there.

**Done when:** no card widget in the app sets a fixed width or height, and cards look proportionate at 390 px and at 1440 px wide.

---

## Issue 7: Left navigation rail on desktop, bottom bar on mobile

Part of T13. Independent of the other issues.

**Today:** `app/shell/app_shell.dart` stacks the branch page, a floating `AiFab` and a bottom `GlassNavBar` for every platform. Pages add `Sizes.navClearance` (104) bottom padding for the floating bar. Tabs are defined in `app/shell/nav_destinations.dart`.

**Decisions:**

- **Bottom bar:** Android app, iOS app and any browser on a phone. Use `defaultTargetPlatform` (on web it reports the browser's OS): `android` or `iOS` → bottom bar.
- **Left rail:** everything else (Windows / macOS / Linux apps and desktop browsers). Width does not decide this.
- **Rail design:** a floating glass rail matching `GlassNavBar`. Waraqah logo (`waraqah_wordmark.dart` or its mark) at the top, the 5 tab icons in the middle (icons only, no always-visible labels), and the AI assistant button pinned at the bottom. On the rail layout the floating `AiFab` is not shown; the rail button opens the same AI chat route.
- **Hover tooltip:** hovering a rail item shows its label and a one-line explanation, for example "Catalog: browse new books from every vendor". Add one explanation ARB key per tab and for the AI button, in both `app_en.arb` and `app_bn.arb`.
- **Mouse wheel:** a scroll-wheel event over the rail switches tabs. Wheel down = next tab, wheel up = previous tab, clamped at the ends. One notch = one tab: ignore further events for about 250 ms. Use `Listener.onPointerSignal` with `PointerScrollEvent` on the rail only; page content keeps normal scrolling.
- **Layout:** on the rail layout, put the rail beside the content (a `Row`), not over it, so content does not need `navClearance`. Make the bottom clearance 0 on the rail layout (for example expose it through a helper that pages already call instead of reading `Sizes.navClearance` directly).
- Tapping the active tab still pops it to its first route (keep `_goBranch`).

**Test (seam 2):** widget test: bottom bar on `TargetPlatform.android`; rail on `TargetPlatform.windows`; hovering a rail item shows its explanation; a `PointerScrollEvent` over the rail moves to the next tab. This is the repo's first widget test.

**Done when:** in the web build at desktop size, the rail shows on the left with working tooltips and wheel switching; on an Android emulator or phone browser the bottom bar shows as before.

---

## Issue 8: Info icon explaining "Non-beneficial"

Part of T13. Needs issue 4 (`benefit_filter_row.dart` in `widgets/`).

**Do:**

1. Add a `danger` colour token to `AppPalette` (light and dark, kept in sync). The palette has no red today.
2. In the benefit filter row, right after the **Non-Beneficial** chip, show a small red circle with a white "i" (`Icons.info_rounded` or a `CircleAvatar` + icon, coloured from `palette.danger`).
3. Wrap it in a `Tooltip` with `triggerMode: TooltipTriggerMode.tap`, so it shows on hover (desktop) and on tap (mobile). Give it a max width so the text wraps, and a long enough `showDuration` to read it.
4. Add the ARB key `homeNonBeneficialNote` with this text:

   **app_en.arb:**
   > Books in this list are curated by our admins. Whether a book benefits a reader often depends on their intention and grounding. Many classical mufassirun, for example, consulted the Torah and the Bible for added context in their tafsir. For the general reader, however, such books are not beneficial, and without due care they may even cause harm.

   **app_bn.arb:**
   > এই তালিকার বইগুলো আমাদের অ্যাডমিন বাছাই করেছেন। কোনো বই পাঠকের উপকারে আসবে কি না, তা অনেক সময় তার নিয়ত ও জ্ঞানের ভিত্তির ওপর নির্ভর করে। যেমন, অনেক প্রসিদ্ধ মুফাসসির তাফসিরে বাড়তি প্রেক্ষাপট ও ব্যাখ্যার জন্য তাওরাত ও বাইবেল পড়েছেন। তবে সাধারণ পাঠকের জন্য এ ধরনের বই উপকারী নয়, এবং সতর্ক না হলে ক্ষতিকরও হতে পারে।

5. Give the icon a `Semantics` label (screen readers).

**Done when:** hovering (desktop) or tapping (phone) the icon shows the note in the current language.

---

## Issue 9: Home UI polish ("glass + aurora")

Handles T13. Needs issues 4, 6, 7 and 8. No new packages: use `BackdropFilter`, slivers, `TweenAnimationBuilder`, `AnimatedScale` and similar built-ins.

**Do:**

1. `HomePage` becomes a `CustomScrollView`:
   - A collapsing `SliverAppBar` with a blurred glass background (same glass look as `GlassNavBar`). It holds the existing `HomeAppBar` content (logo, theme, language, cart).
   - The benefit filter row (with the info icon) is a pinned `SliverPersistentHeader`, so it stays visible while scrolling.
   - The rest (Ayah, Bites, New Books grid as a `SliverGrid`, Nearby P2P) as slivers.
2. Wide screens: center the content with a max width (about 1200 px) so lines are not too long on desktop.
3. Ayah card: a slow animated gradient "aurora" glow behind a glass layer. Keep it readable in light and dark themes. All colours from `AppPalette` (add tokens if needed, in both light and dark).
4. Entrance: sections and cards fade and slide in once, staggered. Keep it short (under ~400 ms each) and do not replay on every rebuild.
5. Press feedback: cards scale down slightly (about 0.97) while pressed, and show a hover lift on desktop.
6. Keep every async block on `AsyncView` + shimmer skeletons shaped like the real content.
7. Keep files under 120 lines: split into small widgets in `presentation/widgets/`.

**Done when:** the home page looks consistent in light and dark, at phone width and desktop width, and nothing jumps or overflows.

---

## Issue 10: Final check

1. `flutter analyze`: no issues.
2. `flutter test`: all pass.
3. `find lib -name '*.dart' ! -name '*.g.dart' ! -name '*.freezed.dart' ! -path '*/l10n/*' | xargs wc -l | awk '$1 > 120'`: prints nothing except the `total` line.
4. Run the web build (`flutter run -d web-server --web-port 8123 --web-hostname 127.0.0.1`). Check home at 390 px and 1440 px wide, in light and dark, in English and Bangla. Check the Catalog, P2P, Bites and Profile tabs still work.
5. Rewrite `README.md` to match the finished code and `CLAUDE.md`. It is deliberately left stale until every other issue is done. Known drift: it still describes the `provider` package + `ChangeNotifier` settings, freezed entities, home reading `bookRepositoryProvider`, and the fixture fallback on `DioException`.
6. Confirm with `git status` that the working tree is clean (everything, including `CLAUDE.md`, `CONTEXT.md` and `docs/agents/`, is committed).
7. Do not open a PR. Tell the owner the branch is ready.
