# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- Run app: `flutter run`
- Analyze/lint: `flutter analyze`
- Run all tests: `flutter test`
- Run single test: `flutter test test/widget_test.dart`
- Get deps: `flutter pub get`

## Project

Waraqah: Flutter mobile app — book marketplace (new + P2P resale), social reading feed ("Book-Bites"), Gemini-powered AI reading assistant, Islamic content curation (Beneficial/Non-Beneficial tagging, daily Ayah on home screen). Backend is Go (REST API) + PostgreSQL, not in this repo — Flutter never talks to Postgres or holds the Gemini API key directly; all of that is proxied through the Go backend. Full design doc: `ARCHITECTURE.md`.

## Architecture

Feature-based "LEGO" architecture: each feature under `lib/features/<name>/` is a self-contained module with its own `presentation/`, `domain/`, `data/` layers (Clean Architecture per feature). Shared code (Book model, cross-feature interfaces, theming, network, storage) lives in `lib/core/`.

Planned feature modules: `auth`, `home`, `catalog`, `p2p`, `book_bites`, `ai_assistant`, `cart`, `checkout`, `profile`. Currently only `home` is implemented.

Data flow: `Flutter UI -> Feature Controller -> Repository -> REST API -> Go Backend -> (PostgreSQL / Gemini API / Cloudinary)`.

State management: Riverpod (`flutter_riverpod`), app-wide `ProviderScope` in `lib/main.dart`. Controllers/providers live under each feature's `presentation/controllers/`.

Routing: GoRouter, configured in `lib/app/router/app_router.dart` (`AppRouter.router`). New routes get added to the `routes` list there as features land. Planned routes per `ARCHITECTURE.md`: `/login`, `/register`, `/profile`, `/home`, `/catalog`, `/catalog/book/:id`, `/p2p`, `/p2p/:id`, `/p2p/create`, `/book-bites`, `/book-bites/create`, `/ai-chat`, `/cart`, `/checkout`, `/orders`.

Theming: `lib/core/theme/app_theme.dart` exposes `AppTheme.lightTheme` / `AppTheme.darkTheme`, wired to system theme mode in `main.dart`.

## Agent skills

### Issue tracker

Issues live in GitHub Issues (`arifinrafi89/Waraqah`), via `gh` CLI. See `docs/agents/issue-tracker.md`.

### Domain docs

Single-context: `CONTEXT.md` + `docs/adr/` at repo root, created lazily. See `docs/agents/domain.md`.
