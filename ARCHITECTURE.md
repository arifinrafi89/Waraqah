# 1. Project Overview
Waraqah is a mobile application that helps users buy new books, resell used books, and stay engaged with reading through a social feed and an AI assistant. The application will combine a primary book marketplace, a peer-to-peer resale marketplace, a social reading feed, an AI recommendation assistant, and Islamic-oriented content curation. 

The main features are:
* Primary marketplace for new books, with cross-vendor price comparison.
* Peer-to-peer marketplace for second-hand books (students reselling textbooks).
* "Book-Bites" social feed with inline book tagging.
* AI reading assistant powered by Gemini.
* Beneficial/non-beneficial book categorization.
* Daily Ayah of the Qur'an on the home screen.
* Cart and checkout (mocked payment for this project).

# 2. Technology Stack
* **Frontend:** Flutter / Dart
* **Architecture:** Feature-Based LEGO Architecture
* **Backend:** Supabase — planned, not yet configured (see section 5)
* **Database:** Postgres, hosted by Supabase
* **AI:** Google Gemini API
* **Navigation:** GoRouter
* **Animation:** Rive
* **Image Storage:** Supabase Storage
* **Catalog source:** Google Books API / Open Library API
* **Communication:** `supabase_flutter` client (no hand-written REST layer)

# 3. Architecture
The Flutter application will follow a feature-based LEGO architecture. Each major feature will act as an independent building block containing its own UI, models, data handling, and business-related components. This makes the application easier to develop, test, maintain, debug, extend, and replace individual features. Shared functionality (the Book model, cross-feature interfaces, theming) will remain inside `core/`. Within each feature, internal code will follow Clean Architecture, separated into presentation, domain, and data layers.

# 4. Project Structure
The basic Flutter structure will be:
```text
lib/
  main.dart
  app/
    +-- app.dart
    +-- router/
          +-- app_router.dart
  core/
    +-- network/
    +-- storage/
    +-- theme/
    +-- widgets/
    +-- services/
    +-- utils/
  features/
    +-- auth/
    +-- home/
    +-- catalog/
    +-- p2p/
    +-- book_bites/
    +-- ai_assistant/
    +-- cart/
    +-- checkout/
    +-- profile/
```
Each feature may follow:
```text
feature/
  +-- presentation/
  +-- domain/
  +-- data/
```

# 5. Backend Architecture
**Status: the backend is still being worked out.** Nothing is built yet.
The app currently runs entirely on hardcoded dummy data (see ADR-0001), and
every screen is a UI demo. The direction is Supabase, but it is not configured
yet, so everything below is intent rather than a commitment.

The plan is to move almost everything to Supabase:
* Authentication and user management — Supabase Auth.
* Books, P2P listings, Book-Bites, cart and orders — Supabase Postgres, read and written through the `supabase_flutter` client.
* Book covers and listing photos — Supabase Storage. Cloudinary is dropped.
* Gemini requests — a Supabase Edge Function, so the app never holds the API key.

Catalog data will come from the Google Books API or the Open Library API.
There are no vendor scraper workers.

The general architecture is:
* Flutter App -> `supabase_flutter` -> Supabase
* Supabase -> Postgres / Storage / Auth
* Supabase Edge Function -> Gemini API
* Supabase Edge Function -> Google Books API / Open Library API

# 6. Database
Postgres, hosted by Supabase, will be used as the main database. It is suitable because the marketplace, P2P listings, and social feed data are relational, with clear foreign-key relationships. 
Tables will include:
* Users, Books, Book Listings (per-vendor price and edition data).
* P2P Listings, Posts (Book-Bites), Post Likes, Book Tags.
* Cart Items, Orders, Reviews.

# 7. Main Features
* **7.1 Primary Marketplace:** Users can browse and buy new physical books and ebooks. It features price comparison across vendors, default sorting by cheapest first (ties broken by average review score), and displays reviews, previews, and ratings.
* **7.2 Second-Hand Marketplace (P2P):** Aimed at students reselling course textbooks. It features a separate listing flow (condition reporting, pricing, photos) and is independent from the primary catalog.
* **7.3 Book-Bites (Social Feed):** A lightweight, Twitter-style feed for short posts, reading progress, and quick reviews. It includes inline book tagging where tapping a tagged book opens its purchase page. The paginated feed is backed by Postgres.
* **7.4 AI Reading Assistant:** An embedded chatbot powered by the free Google Gemini API. A Supabase Edge Function proxies all requests so the app never holds the API key. Catalog data is injected into the prompt so recommendations stay within Waraqah's own listings.
* **7.5 Islamic Curation:** Books are tagged Beneficial or Non-Beneficial and can be filtered accordingly. A daily Ayah of the Qur'an is shown at the top of the home screen.

# 8. Navigation
GoRouter will be used for application navigation. Authentication-protected routes will be handled by route guards. 
Main routes will include:
* `/login`, `/register`, `/profile`
* `/home`, `/catalog`, `/catalog/book/:id`
* `/p2p`, `/p2p/:id`, `/p2p/create`
* `/book-bites`, `/book-bites/create`
* `/ai-chat`, `/cart`, `/checkout`, `/orders`, `/search`

The five top-level tab routes (`/home`, `/catalog`, `/p2p`, `/book-bites`,
`/profile`) are nested under a single `StatefulShellRoute.indexedStack` in
`AppRouter`, so `AppBottomNav` renders once at the shell level instead of
being duplicated per page, and each tab keeps its own scroll position when
switching. Routes outside the shell (`/login`, `/cart`, `/search`,
`/ai-chat`, ...) are pushed normally and don't show the bottom nav.

# 9. Data Flow
The UI is kept separate from backend and database implementation. The flow is:
`Flutter UI -> Feature Controller -> Repository -> supabase_flutter -> Supabase (Postgres / Storage / Edge Function -> Gemini API)`

# 10. Security
* Flutter will not connect directly to Postgres; all access goes through Supabase's API layer, guarded by row-level security.
* Sensitive API keys (Gemini) will not be exposed in the Flutter app.
* Authentication will be handled by Supabase Auth.
* Orders and prices will be validated by the backend.
* Checkout is mocked for this project; no real payment credentials are handled.

# 11. Final Architecture
The complete system is designed to keep Waraqah modular and simple. Flutter handles the application, Supabase handles the backend, and Postgres stores application data. Each major feature remains an independent LEGO-style module, talking to the outside world through a repository interface — which is what makes today's dummy-data implementation swappable for Supabase later.

```text
                        Waraqah
                           |
            +--------------+--------------+
            |                             |
       Flutter App                     Supabase
            |                             |
      LEGO Features              Auth / API / Functions
            |                             |
  +----+----+----+----+         +---------+---------+
  |    |    |    |    |         |         |         |
Catalog P2P Bites Cart       Postgres  Storage   Gemini
  (AI Chat, Checkout, Islamic Curation)
```