# Waraqah — Flutter Frontend

A book marketplace, peer-to-peer resale, social reading feed and AI reading
assistant for students. This repository holds the **Flutter frontend only**; the
Go REST API and PostgreSQL schema live in a separate backend repository.

| | |
|---|---|
| Framework | Flutter / Dart |
| Architecture | Feature-based LEGO + Clean Architecture inside each block |
| Routing | GoRouter with a `StatefulShellRoute` |
| State | Riverpod (feature data) + Provider (app-wide settings) |
| Networking | Dio |
| Models | freezed + json_serializable (`build_runner`) |
| Localisation | `flutter_localizations` + ARB codegen — English & Bangla |
| Loading states | Shimmer skeletons |
| Cache | In-memory TTL cache per repository |

## Getting started

```bash
flutter pub get
dart run build_runner build
flutter run
```

`build_runner` generates `*.freezed.dart` and `*.g.dart` for the models.
`flutter pub get` regenerates the localisation classes in `lib/l10n/`.

## Project structure

```
lib/
├── main.dart                  entry point only — no widgets
├── app/
│   ├── app.dart               MaterialApp.router, theme + locale wiring
│   ├── app_bootstrap.dart     async start-up, ProviderScope, Provider
│   ├── router/                GoRouter config and route constants
│   └── shell/                 glass bottom nav, AI FAB, shell scaffold
├── core/                      shared across every feature
│   ├── cache/                 TtlCache
│   ├── models/                Book — the one cross-feature model
│   ├── network/               Dio client, API routes
│   ├── settings/              theme mode + locale (ChangeNotifier)
│   ├── state/                 SelectionNotifier helper
│   ├── theme/                 design tokens, ThemeData, typography
│   ├── utils/                 formatters, cover gradients
│   └── widgets/               the reusable LEGO bricks
├── l10n/                      app_en.arb, app_bn.arb + generated classes
└── features/
    ├── auth/                  login / sign-up
    ├── home/                  Ayah of the Day, curation filter, feed sections
    ├── catalog/               cross-vendor catalog, search, price sorting
    ├── bites/                 Book-Bites social feed (cards + preview strip)
    ├── p2p/                   second-hand marketplace (cards + preview strip)
    ├── ai_assistant/          Gemini reading assistant chat
    └── profile/               profile, theme switcher, language switcher
```

Each feature is a self-contained block:

```
feature/
├── domain/        entities (freezed) + repository interfaces
├── data/          remote sources, fixtures, repository implementations
└── presentation/  Riverpod providers, pages, widgets
```

Features talk to each other **only** through the other block's repository
interface or public provider — never through its data layer. Home, for example,
gets its books from `bookRepositoryProvider` in the catalog block.

## Conventions

- **No file exceeds 120 lines.** Widgets are split into small bricks instead.
- **`main.dart` contains no widgets.** Start-up lives in `app_bootstrap.dart`.
- **Colours come from `AppPalette`**, a `ThemeExtension`, read with
  `context.palette`. Both light and dark are defined in one file.
- **Every async surface has a shimmer skeleton** shaped like its real content,
  wired through the shared `AsyncView` widget.
- **Strings come from ARB files.** No user-facing literals in widgets.

## Backend

The Go backend is not wired up yet. Each remote data source targets its real
endpoint through Dio and falls back to bundled fixtures when the call fails, so
the app is fully demoable offline. Pointing it at the live API means changing
`ApiConfig.baseUrl` and deleting the fallback — no UI code changes.

## Branches

Work lands one feature per branch, each opened as a pull request against `main`:

| Branch | Scope |
|---|---|
| `feature/project-foundation` | theme, router, shell, l10n, core bricks |
| `feature/auth-ui` | log in / sign up screen |
| `feature/home-screen` | Ayah card, curation filter, home sections |
| `feature/catalog-screen` | search, category pills, price-sorted results |
| `feature/ai-assistant` | Gemini chat UI |
| `feature/profile-settings` | profile, theme and language switchers |
