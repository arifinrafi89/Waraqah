# Waraqah Architecture Design Document

This document defines the architectural patterns, structural boundaries, data flows, and conventions for the Waraqah Flutter application. It serves as the single source of truth for file placement and technical decisions.

---

## 1. Folder/Module Structure

Waraqah follows a **"Lego on the outside, Clean Architecture on the inside"** feature-first modular architecture.

- **Outer Layer (Lego / Feature-First):** Major feature modules are isolated building blocks. Feature modules **never directly depend on or import each other**.
- **Shared Layer (`core/`):** Houses feature-agnostic utilities, the canonical shared `Book` domain entity, network client singletons (Supabase & Dio), theme tokens, and base UI primitives. Features may only depend on `core/`. Future features (e.g., `[FUTURE]` Book-Bites, `[FUTURE]` AI Assistant) plug into `core/` without modifying or coupling with Primary or P2P Marketplace modules.
- **Inner Layer (Clean Architecture):** Each feature is internally organized into three strict horizontal layers: `domain/`, `data/`, and `presentation/`.

### Directory Layout

```text
lib/
├── main.dart                               # Application entrypoint & initialization
├── app/                                    # App shell, routing, global providers
│   ├── app.dart                            # MaterialApp.router configuration
│   └── router/                             # GoRouter declarative route tree & shells
│       └── app_router.dart
├── core/                                   # Shared across all features (no feature imports)
│   ├── constants/                          # App-wide constants (keys, storage keys, assets)
│   ├── errors/                             # Failure definitions & exception handlers
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/                            # Network clients & interceptors
│   │   ├── dio_client.dart                 # Configured Dio instance for Go API
│   │   └── supabase_client.dart            # Supabase instance wrapper
│   ├── domain/                             # Shared entities & value objects
│   │   └── entities/
│   │       ├── book.dart                   # Canonical shared Book entity
│   │       └── user_profile.dart           # User profile & role representation
│   ├── theme/                              # Design system tokens & Material 3 theme
│   │   ├── app_colors.dart
│   │   ├── app_typography.dart
│   │   └── app_theme.dart                  # open_ui_kit / shadcn token integrations
│   └── widgets/                            # Reusable base widgets (buttons, inputs, cards)
│       ├── app_button.dart
│       ├── app_text_field.dart
│       └── empty_state_view.dart
└── features/
    ├── auth/                               # User authentication & session management
    │   ├── domain/
    │   │   ├── entities/user_session.dart
    │   │   └── repositories/auth_repository.dart
    │   ├── data/
    │   │   ├── datasources/auth_remote_datasource.dart # Supabase Auth calls
    │   │   ├── models/user_dto.dart
    │   │   └── repositories/auth_repository_impl.dart
    │   └── presentation/
    │       ├── controllers/auth_controller.dart
    │       ├── pages/
    │       │   ├── login_page.dart
    │       │   └── register_page.dart
    │       └── widgets/auth_form.dart
    │
    ├── primary_marketplace/                # Primary Marketplace: New books & simulated bKash checkout
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   ├── primary_listing.dart    # Format/edition pricing variant
    │   │   │   ├── order.dart
    │   │   │   └── order_item.dart
    │   │   └── repositories/
    │   │       ├── catalog_repository.dart
    │   │       └── checkout_repository.dart
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   ├── catalog_remote_datasource.dart # Supabase PostgREST + Go API
    │   │   │   └── checkout_remote_datasource.dart # Go API simulated bKash endpoint
    │   │   ├── models/
    │   │   │   ├── primary_listing_dto.dart
    │   │   │   └── order_dto.dart
    │   │   └── repositories/
    │   │       ├── catalog_repository_impl.dart
    │   │       └── checkout_repository_impl.dart
    │   └── presentation/
    │       ├── controllers/
    │       │   ├── catalog_controller.dart
    │       │   ├── book_detail_controller.dart
    │       │   └── checkout_controller.dart
    │       ├── pages/
    │       │   ├── catalog_page.dart
    │       │   ├── book_detail_page.dart
    │       │   ├── checkout_page.dart
    │       │   └── order_success_page.dart
    │       └── widgets/
    │           ├── book_card.dart
    │           ├── edition_selector.dart
    │           ├── price_tag.dart
    │           └── rive_add_to_cart_button.dart
    │
    ├── p2p_marketplace/                    # P2P Used books, photos & Realtime chat
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   ├── p2p_listing.dart        # Used book listing (independent of Book entity)
    │   │   │   ├── conversation.dart
    │   │   │   └── chat_message.dart
    │   │   └── repositories/
    │   │       ├── p2p_listing_repository.dart
    │   │       └── p2p_chat_repository.dart
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   ├── p2p_remote_datasource.dart     # Supabase PostgREST & Storage
    │   │   │   └── p2p_realtime_datasource.dart   # Supabase Realtime channels
    │   │   ├── models/
    │   │   │   ├── p2p_listing_dto.dart
    │   │   │   └── chat_message_dto.dart
    │   │   └── repositories/
    │   │       ├── p2p_listing_repository_impl.dart
    │   │       └── p2p_chat_repository_impl.dart
    │   └── presentation/
    │       ├── controllers/
    │       │   ├── p2p_feed_controller.dart
    │       │   ├── create_listing_controller.dart
    │       │   └── chat_controller.dart
    │       ├── pages/
    │       │   ├── p2p_feed_page.dart
    │       │   ├── p2p_detail_page.dart
    │       │   ├── create_p2p_listing_page.dart
    │       │   ├── conversations_list_page.dart
    │       │   └── chat_page.dart
    │       └── widgets/
    │           ├── p2p_listing_card.dart
    │           ├── condition_badge.dart
    │           └── chat_bubble.dart
    │
    └── admin/                              # Admin oversight (REQ-5.3)
        ├── domain/
        │   └── repositories/admin_repository.dart
        ├── data/
        │   ├── datasources/admin_remote_datasource.dart # Go API admin endpoints
        │   └── repositories/admin_repository_impl.dart
        └── presentation/
            ├── controllers/admin_controller.dart
            ├── pages/
            │   ├── admin_dashboard_page.dart
            │   ├── admin_orders_page.dart
            │   └── admin_moderation_page.dart
            └── widgets/admin_order_card.dart
```

Where files belong:
- **`domain/`**: Pure Dart. Entities, value objects, domain logic, and abstract repository interfaces. Must not import Flutter UI libraries (`flutter/material.dart`), Riverpod, Dio, or Supabase.
- **`data/`**: Repository implementations, DTOs (`freezed`/`json_serializable`), and remote data sources talking to Supabase or Dio (Go API).
- **`presentation/`**: Flutter UI widgets, page screens, and Riverpod controllers/notifiers managing screen state.
- **`core/`**: Reusable widgets, shared domain entities (e.g. `Book`), network infrastructure, design tokens, and error definitions.

---

## 2. State Management Pattern

The application uses **`flutter_riverpod`** for declarative, predictable, and compile-safe state management.

### Rules of State Flow
1. **Unidirectional State Flow:**
   `UI Action` $\rightarrow$ `Notifier/Controller` $\rightarrow$ `Repository` $\rightarrow$ `State Update (AsyncValue)` $\rightarrow$ `UI Render`
2. **State Representation:**
   All asynchronous operations are exposed to the presentation layer as `AsyncValue<T>` (`AsyncData`, `AsyncLoading`, `AsyncError`). UI widgets consume state using `state.when(...)` or `ref.watch(...)`.
3. **Notifier Types:**
   - Use `AsyncNotifier<T>` / `AutoDisposeAsyncNotifier<T>` for asynchronous lifecycle-managed state (e.g., fetching catalog, submitting an order, sending a message).
   - Use `Notifier<T>` for synchronous state (e.g., active filters, form draft values).
   - Use standard `Provider<T>` for read-only singletons (e.g., repository instances, API clients).
4. **State Boundaries:**
   - State lives strictly inside the `presentation/controllers/` folder of its respective feature.
   - Cross-cutting state (such as the authenticated user session) lives in `features/auth/` or `core/` and is consumed by other features as a read-only provider dependency (e.g., `ref.watch(currentUserProvider)`).
   - Ephemeral UI state (such as text field focus, local tab index, or modal sheet visibility) is managed locally using standard Flutter `StatefulWidget` or Flutter hooks.

---

## 3. Data Flow & Layering

Strict separation of concerns is enforced via the **Adjacent Layer Rule**.

### The Adjacent Layer Rule
```
[ Presentation Layer: UI Widgets ]
              ↕ (reads state / dispatches intents)
[ Presentation Layer: Controllers / Notifiers ]
              ↕ (invokes domain use cases / contracts)
[ Domain Layer: Repository Interfaces & Entities ]
              ↕ (implements contracts)
[ Data Layer: Repository Implementations ]
              ↕ (fetches raw data / DTOs)
[ Data Layer: Data Sources (Supabase SDK / Dio Go API) ]
```

- **Rule 1:** A layer may **only** communicate with its directly adjacent layer.
- **Rule 2:** UI Widgets must never interact directly with Repositories or Data Sources. They invoke methods on Notifiers.
- **Rule 3:** Notifiers must depend on Domain Repository interfaces, never on concrete Data Sources or raw HTTP/database clients.
- **Rule 4:** The Domain layer is completely independent and contains zero dependencies on outer layers (no Flutter, no Dio, no Supabase).
- **Rule 5:** Repositories in the Data layer map raw DTOs (`BookDto`, `PrimaryListingDto`) into immutable Domain Entities (`Book`, `PrimaryListing`) before returning them to the domain/presentation layer.

---

## 4. Backend/API Integration Shape

Per PRD §5, Waraqah employs a split-backend strategy dividing responsibilities between **Supabase** and a custom **Go API**.

### Responsibilities Matrix

| Backend Target | Communication Channel | Operations Handled |
|---|---|---|
| **Supabase** | `supabase_flutter` SDK | • User Auth (Sign up, Sign in, Session refresh)<br>• Storage (Listing photos, user avatars)<br>• Realtime (P2P instant messaging channels)<br>• Simple Reads (Public catalog browsing `books` & `primary_listings` via PostgREST + RLS) |
| **Go API** | `Dio` HTTP Client | • Google Books API synchronization & cache refresh<br>• Custom price sorting (cheapest $\rightarrow$ expensive) & rating tie-breaks<br>• Mock price assignment fallback (`saleability = NOT_FOR_SALE`)<br>• Simulated bKash transactional checkout (`/api/v1/orders/checkout`)<br>• Admin operations (`/api/v1/admin/...` with `role = 'admin'` validation) |

### API & Service Class Architecture
- **Location:**
  - Base clients live in `lib/core/network/` (`dio_client.dart`, `supabase_client.dart`).
  - Feature data sources live in `lib/features/<feature>/data/datasources/`.
- **Dio Interceptors:**
  A custom `AuthInterceptor` attaches the active Supabase JWT access token to every outgoing Dio request to the Go backend (`Authorization: Bearer <token>`).
- **Error Handling Pattern:**
  - Data sources catch `DioException` and `PostgrestException` / `AuthException`, translating them into domain-level exceptions (`ServerException`, `AuthException`, `NetworkException`).
  - Repositories catch domain exceptions and convert them into immutable `Failure` objects (`ServerFailure`, `AuthFailure`, `NetworkFailure`).
  - Notifiers expose failures via `AsyncValue.error(failure, stackTrace)`, allowing presentation widgets to render accessible, user-friendly error banners and retry actions.

---

## 5. Naming Conventions

Consistency across the codebase ensures clean navigation and automated tooling compatibility:

- **Files & Directories:**
  - Always `snake_case.dart` (e.g., `catalog_repository.dart`, `primary_listing_card.dart`, `book_detail_page.dart`).
  - Directory names are always `snake_case` (e.g., `primary_marketplace`, `p2p_marketplace`).
- **Classes & Types:**
  - Always `PascalCase` (e.g., `Book`, `CatalogNotifier`, `PrimaryListingRepositoryImpl`).
- **Interfaces vs. Implementations:**
  - Interfaces in `domain/repositories/`: `AuthRepository`, `CatalogRepository`.
  - Implementations in `data/repositories/`: `AuthRepositoryImpl`, `CatalogRepositoryImpl`.
- **DTOs / Models:**
  - Suffix with `Dto` in `data/models/` (e.g., `BookDto`, `P2pListingDto`).
  - Pure domain entities in `domain/entities/` do not have suffixes (e.g., `Book`, `P2pListing`).
- **Providers:**
  - Suffix with `Provider` (e.g., `catalogNotifierProvider`, `authRepositoryProvider`, `currentUserProvider`).
- **Page Widgets:**
  - Suffix with `Page` (e.g., `LoginPage`, `CatalogPage`, `ChatPage`).
- **Components / Widgets:**
  - Specific descriptive nouns (e.g., `AyahCard`, `ConditionBadge`, `PriceTag`).

---

## 6. Decisions Made on the User's Behalf

Per Section 2 fallback rules, the following architectural and technological decisions have been made where PRD.md left details unspecified:

1. **Token-Driven UI / Design System (`open_ui_kit`):**
   PRD §4.3 mandates `open_ui_kit` with adaptive visual budgets on Android to prevent GPU blur frame-drops. We implement a clean token layer (`lib/core/theme/`) modeling shadcn-inspired tokens (surfaces, borders, typography, muted colors, primary emerald palette) matching Material 3, without `BackdropFilter` on scrolling lists.
2. **Configuration & Secrets Handling:**
   Using `flutter_dotenv` combined with `--dart-define` support. Keys defined: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, and `GO_API_BASE_URL`. A `.env.example` file is provided, while `.env` is `.gitignore`'d to guarantee no secrets are committed.
3. **Admin Credential & Promotion Architecture:**
   Per REQ-2.3, the admin uses standard Supabase Auth signup. Role elevation (`role = 'admin'`) is handled via database seed or Go backend setup scripts, never through hardcoded client logic.
4. **Offline & Image Caching:**
   Using `cached_network_image` with subtle placeholder shimmer/fallbacks for both Google Books covers and Supabase P2P listing photos, optimizing bandwidth and frame rendering.
5. **Localization Scope:**
   `intl` and `flutter_localizations` configured for `en` (English) and `bn` (Bangla) with `.arb` files located in `lib/l10n/`.
6. **Simulated bKash Security:**
   Checkout PIN input is completely ephemeral in memory. It is passed to the Go API simulation endpoint over HTTPS or processed purely in the simulation service; no PIN or unmasked payment data is ever stored in the database or client cache (REQ-3.1.8, §6.1).

