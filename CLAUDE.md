# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Waraqah is the **Flutter frontend only** for a student book marketplace (catalog, P2P resale, "Bites" social feed, AI reading assistant). The Go REST API lives in a separate repo and is not wired up yet.

## Strict rules (teacher review)

Every change must follow these. They override anything else in this file.

1. Riverpod is the only state library. No `provider` package, no `ChangeNotifier`, no `*Controller` state classes (Flutter's `TextEditingController` etc. are fine). Expose all state as Riverpod providers (`Provider`, `FutureProvider`, `NotifierProvider`).
2. Use a `Notifier` only when state has real actions (for example `toggleTheme()`). For a trivial one-value UI choice, use `selectionProvider<T>` from `core/state/selection_notifier.dart`.
3. Each feature has `domain/entities/` (pure classes, no JSON) and `data/models/` (JSON, with `toEntity()`). Repository implementations return entities.
4. Each feature has `domain/usecases/`. A use case extends `UseCase<Result, Params>` from `core/usecase/usecase.dart`. Providers call use cases, never repositories directly (only the provider that builds a use case watches the repository).
5. One screen per feature. A part that is not an independent screen is a widget in `presentation/widgets/`. No `sections/` folders.
6. Size cards with `AspectRatio` / `childAspectRatio` and max-extent grids. No fixed card widths or heights.
7. All data goes through `dioProvider`. There is no backend: a `FakeApiInterceptor` answers from fixtures. Remote sources never catch `DioException` to fall back to fixtures.

## Commands

```bash
flutter pub get                                      # also regenerates lib/l10n/app_localizations*.dart
dart run build_runner build --delete-conflicting-outputs   # regenerate *.freezed.dart / *.g.dart
flutter analyze
flutter test                                         # tests live in test/*_test.dart (split past 120 lines)
flutter test test/widget_test.dart --plain-name "Bdt.format"   # single group/test by name/file
flutter run -d web-server --web-port 8123 --web-hostname 127.0.0.1   # config in .claude/launch.json
```

Generated files (`*.freezed.dart`, `*.g.dart`, `lib/l10n/app_localizations*.dart`) are committed. Re-run codegen after editing any `@freezed` class or ARB file, and commit the output.

## Architecture

- `main.dart` only calls `runApp(await AppBootstrap.start())`. `app/app_bootstrap.dart` opens `SettingsStore` (shared_preferences) and wraps the app in `ProviderScope`.
- **Riverpod only** (rule 1). App-wide theme mode + locale live in `settingsProvider` (`core/settings/`). `WaraqahApp` watches it so switching either rebuilds the whole app.
- **Routing** (`app/router/`): one GoRouter. Auth, AI chat, and P2P add-listing are top-level routes pushed over the shell. The five tabs (home, catalog, p2p, bites, profile) are branches of a `StatefulShellRoute.indexedStack`. Add paths to `AppRoutes` and names to `RouteNames` in `app_routes.dart`.
- **Feature blocks** (`lib/features/<name>/`) follow `domain/` (entities, repository interfaces, use cases) → `data/` (models, remote sources, fixtures, repository impls) → `presentation/` (providers, one page, widgets). See rules 3–5. Some blocks (auth, profile) are presentation-only today; any data they gain follows rules 3–4.
- **Cross-feature rule:** a feature may use another feature only through its use cases, entities, or public providers, never its `data/` layer. Example: home and ai_assistant currently read `bookRepositoryProvider` from `features/catalog/presentation/providers/catalog_providers.dart`; under rule 4 they go through catalog use cases instead. `Book` is the one shared type. It still lives in `core/models/` as a freezed JSON class; under rule 3 it splits into an entity and a model.
- **Data flow:** `dioProvider` (`core/network/`) → `XRemoteSource(dio)` → `XRepositoryImpl` wrapping a `TtlCache` (`core/cache/`) → `FutureProvider`s in the feature's providers file.
- **Fake API** (rule 7): `dioProvider` always has a `FakeApiInterceptor` (`core/network/fake_api_interceptor.dart`) installed, overridden in `AppBootstrap`. It answers a known path from a route table after an artificial ~900ms delay (so shimmer skeletons show) and rejects an unknown path with 404. The route table (`app/fake_api_routes.dart`) is the composition root: it imports feature fixtures and does the category/query filtering, which `core/` never does. Remote sources call Dio directly and never catch `DioException`. Going live = point `ApiConfig.baseUrl` (`core/network/api_config.dart`) at the real Go service and remove the interceptor. `.env` exists but nothing in `lib/` reads it.
- **Simple UI selections** (chosen category, search text, filter) use `selectionProvider<T>(initial)` from `core/state/selection_notifier.dart` (rule 2). Riverpod 3 has no `StateProvider`, so do not reach for it.
- **Book sort rule** (catalog repository): cheapest `priceBdt` first, ties broken by higher `rating`.

## Conventions (from README, enforced by review)

- **No file over 120 lines.** Split widgets into small bricks in `presentation/widgets/` (rule 5).
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
