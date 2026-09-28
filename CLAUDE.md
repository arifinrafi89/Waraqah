# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Waraqah is the **Flutter frontend only** for a student book marketplace (catalog, P2P resale, "Bites" social feed, AI reading assistant). The Go REST API lives in a separate repo and is not wired up yet.

## Commands

```bash
flutter pub get                                      # also regenerates lib/l10n/app_localizations*.dart
dart run build_runner build --delete-conflicting-outputs   # regenerate *.freezed.dart / *.g.dart
flutter analyze
flutter test                                         # all tests live in test/widget_test.dart
flutter test test/widget_test.dart --plain-name "Bdt.format"   # single group/test by name
flutter run -d web-server --web-port 8123 --web-hostname 127.0.0.1   # config in .claude/launch.json
```

Generated files (`*.freezed.dart`, `*.g.dart`, `lib/l10n/app_localizations*.dart`) are committed. Re-run codegen after editing any `@freezed` class or ARB file, and commit the output.

## Architecture

- `main.dart` only calls `runApp(await AppBootstrap.start())`. `app/app_bootstrap.dart` opens `SettingsStore` (shared_preferences) and wraps the app in `ProviderScope` + `ChangeNotifierProvider<SettingsController>`.
- **Two state systems, deliberately split:** Riverpod for feature data; `provider` package only for app-wide theme mode + locale (`core/settings/`). `WaraqahApp` watches `SettingsController` so switching either rebuilds the whole app.
- **Routing** (`app/router/`): one GoRouter. Auth, AI chat, and P2P add-listing are top-level routes pushed over the shell. The five tabs (home, catalog, p2p, bites, profile) are branches of a `StatefulShellRoute.indexedStack`. Add paths to `AppRoutes` and names to `RouteNames` in `app_routes.dart`.
- **Feature blocks** (`lib/features/<name>/`) follow `domain/` (freezed entities + repository interfaces) → `data/` (remote sources, fixtures, repository impls) → `presentation/` (providers, pages, widgets). Some blocks (auth, profile) are presentation-only.
- **Cross-feature rule:** a feature may use another feature only through its repository interface or public providers, never its `data/` layer. Example: home and ai_assistant read `bookRepositoryProvider` from `features/catalog/presentation/providers/catalog_providers.dart`. `Book` is the one shared model and lives in `core/models/`.
- **Data flow:** `dioProvider` (`core/network/`) → `XRemoteSource(dio)` → `XRepositoryImpl` wrapping a `TtlCache` (`core/cache/`) → `FutureProvider`s in the feature's providers file.
- **Offline fallback:** remote sources catch `DioException` and return filtered data from `data/sources/*_fixtures.dart` after an artificial ~900ms delay (so shimmer skeletons show). Going live = change `ApiConfig.baseUrl` in `core/network/api_config.dart` and delete the fallback. `.env` exists but nothing in `lib/` reads it.
- **Simple UI selections** (chosen category, search text, filter) use `selectionProvider<T>(initial)` from `core/state/selection_notifier.dart`. Riverpod 3 has no `StateProvider`, so do not reach for it.
- **Book sort rule** (catalog repository): cheapest `priceBdt` first, ties broken by higher `rating`.

## Conventions (from README, enforced by review)

- **No file over 120 lines.** Split widgets into small bricks in `presentation/widgets/` (or `sections/` for home).
- **Colours only from `AppPalette`** (a `ThemeExtension` in `core/theme/app_palette.dart`), read via `context.palette`. Light and dark live in the same file and must stay in sync. Spacing from `Insets` (`app_dimens.dart`), text styles from `AppFonts` (`app_typography.dart`).
- **Every async surface** renders through `core/widgets/AsyncView` with a shimmer skeleton shaped like the real content.
- **No user-facing string literals in widgets.** Add keys to both `lib/l10n/app_en.arb` (template) and `app_bn.arb` (Bangla), then access through `AppL10n.of(context)`.
- Reuse the bricks in `core/widgets/` (buttons, text field, chips, cards, section header, app bar) before writing new ones.
- One feature per branch, PR against `main`.

## Agent skills

### Issue tracker

Issues live in GitHub Issues for `arifinrafi89/Waraqah`, managed with the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

Default vocabulary: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: one root `CONTEXT.md` plus `docs/adr/`. See `docs/agents/domain.md`.
