# Waraqah — Flutter Frontend

A book marketplace, peer-to-peer resale, social reading feed and AI reading
assistant for students. This repository holds the **Flutter frontend only**.
There is no backend: a fake API interceptor answers every request from fixtures.

| | |
|---|---|
| Framework | Flutter / Dart |
| Architecture | Feature blocks, each with domain / data / presentation layers |
| Routing | GoRouter with a `StatefulShellRoute.indexedStack` |
| State | Riverpod only |
| Networking | Dio + `FakeApiInterceptor` (no real server) |
| Models | freezed + json_serializable (`build_runner`) |
| Localisation | `flutter_localizations` + ARB codegen — English & Bangla |
| Loading states | Shimmer skeletons |
| Cache | In-memory TTL cache per repository |

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
flutter analyze
flutter test
```

`build_runner` generates `*.freezed.dart` and `*.g.dart`.
`flutter pub get` regenerates the localisation classes in `lib/l10n/`.
Generated files are committed.

## Project structure

```
lib/
├── main.dart                  entry point only — no widgets
├── app/
│   ├── app.dart               MaterialApp.router, theme + locale wiring
│   ├── app_bootstrap.dart     async start-up, ProviderScope, overrides
│   ├── fake_api_routes.dart   fake API route table (composition root)
│   ├── router/                GoRouter config, AppRoutes / RouteNames
│   └── shell/                 bottom bar (mobile), glass rail (desktop), AI button
├── core/                      shared across every feature
│   ├── cache/                 TtlCache
│   ├── models/                Book — the one cross-feature model
│   ├── network/               Dio client, fake API interceptor, ApiException
│   ├── settings/              theme mode + locale (Notifier + SettingsStore)
│   ├── state/                 selectionProvider for one-value UI choices
│   ├── theme/                 AppPalette, Insets, AppFonts, ThemeData
│   ├── usecase/               UseCase<Result, Params> base
│   ├── utils/                 formatters, cover gradients
│   └── widgets/               reusable bricks (AsyncView, cards, glass, motion)
├── l10n/                      app_en.arb, app_bn.arb + generated classes
└── features/
    ├── auth/                  login / sign-up
    ├── home/                  Ayah of the Day, Benefit filter, feed slivers
    ├── catalog/               cross-vendor catalog, search, price sorting
    ├── bites/                 Book-Bites social feed
    ├── p2p/                   second-hand marketplace
    ├── ai_assistant/          reading assistant chat
    └── profile/               profile, theme and language switchers
```

Each feature is a self-contained block:

```
feature/
├── domain/        entities (pure classes), repository interfaces, use cases
├── data/          models (JSON, toEntity), remote sources, fixtures, repositories
└── presentation/  Riverpod providers, one page, widgets/
```

Features talk to each other **only** through another block's use cases,
entities or public providers — never its `data/` layer.

## Rules

1. Riverpod is the only state library. No `provider`, no `ChangeNotifier`.
2. A `Notifier` only when state has real actions; otherwise `selectionProvider<T>`.
3. Entities in `domain/entities/`, JSON models in `data/models/` with `toEntity()`.
4. Providers call use cases (`UseCase<Result, Params>`), not repositories.
5. One screen per feature; other parts are widgets in `presentation/widgets/`.
6. Size cards with `AspectRatio` / max-extent grids, never fixed width or height.
7. All data goes through `dioProvider`; remote sources never catch `DioException`
   to fall back to fixtures.

## Conventions

- **No file exceeds 120 lines.** Split widgets into small bricks.
- **`main.dart` contains no widgets.** Start-up lives in `app_bootstrap.dart`.
- **Colours come from `AppPalette`** via `context.palette`; light and dark stay in sync.
- **Every async surface** renders through `AsyncView` with a shimmer skeleton.
- **Strings come from ARB files.** No user-facing literals in widgets.

## Navigation

Android, iOS and phone browsers get a bottom bar. Desktop apps and desktop
browsers get a floating glass rail on the left: hover shows a label and
explanation, and the mouse wheel over the rail moves one tab per notch.

## Backend

Not wired up. `dioProvider` installs a `FakeApiInterceptor` that answers known
paths from the route table in `app/fake_api_routes.dart` after ~900 ms and
rejects unknown paths with 404. Going live means pointing `ApiConfig.baseUrl`
(`core/network/api_config.dart`) at the real service and removing the
interceptor. No UI code changes.

## Branches

One feature per branch, pull request against `main`.
