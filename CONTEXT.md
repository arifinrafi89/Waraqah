# Waraqah

A Flutter mobile app: book marketplace, P2P resale, social reading feed, AI reading assistant, Islamic content curation. Backend (Supabase) is planned but not yet implemented; the frontend currently ships with hardcoded dummy data shaped to match the planned Supabase schema.

## Language

**Book**:
A catalog title cached from Google Books / Open Library, keyed by `google_books_id` or `open_library_id`. Carries `is_beneficial` for Islamic curation. In the real schema stores a single `price`; per-vendor comparison is a future schema extension (see ADR-0001).
_Avoid_: Title, Product.

**Post**:
The domain/data-layer name for a Book-Bite: a short social post with `author_id`, `content`, tagged books (`post_book_tags`), and likes.
_Avoid_: BookBite class name — "Book-Bite" is the UI-facing label only; the underlying entity is `Post`, mirroring the `posts` table.

**Book-Bite**:
The UI-facing term for a `Post` on the social feed. Never used as a class/type name in code.
_Avoid_: using this as a Dart identifier.

**P2pListing**:
A second-hand book listing, optionally linked to a `Book` (`book_id` nullable), with `condition` (`P2pCondition`: like_new/good/fair), `price`, `photo_urls`, `status` (available/reserved/sold).
_Avoid_: Listing (ambiguous with future primary-marketplace listings).

**Profile**:
The app-facing user record extending Supabase `auth.users` with `full_name`, `university`, `student_id`, `avatar_url`.
_Avoid_: User (reserve for the auth-layer concept once auth exists).

**Vendor demo field**:
Flat, dummy-only fields (`vendorName`, `isBest`, `originalPrice`) added directly to the `Book` domain model to drive the New Books grid's price-comparison UI. Not part of the real `books` table shape — the schema stores one price per book; true cross-vendor comparison is a future extension (see ADR-0001). These fields are expected to be removed/reshaped when that extension lands.
_Avoid_: Treating these as stable schema — they're a placeholder for a not-yet-built feature.

**Local Catalog Store**:
The single in-memory dummy `Book` list living in `lib/core/`, read by both Home and Catalog. Exists only because there's no Supabase backend yet; shaped to match the planned Supabase `books` table so swapping in the real API later is a repository-layer change, not a UI change.
_Avoid_: Confusing this with "the real schema" (CONTEXT.md's existing term for the future Supabase schema) — the Local Catalog Store is a throwaway stand-in, discarded once Supabase lands.

**AppPalette**:
The `ThemeExtension` carrying one of the 6 design-brief color themes (Forest, Nord, Tokyo Night, Tokyo Day, Catppuccin Mocha, Catppuccin Latte). Selecting mode (light/dark) picks the family (3 options per mode); selection persists via SharedPreferences.
_Avoid_: ColorScheme (that's the underlying Flutter type `AppPalette` wraps, not the concept users pick between).

**CartItem**:
A line in the cart: a `bookId` plus a `quantity`. Only primary-catalog `Book`s can become `CartItem`s — a `P2pListing` never does, since second-hand listings are one-of-a-kind and P2P is independent of the primary catalog.
_Avoid_: CartLine, CartEntry.

**Order**:
A placed order: `items` (the `CartItem`s at the moment of placement), `total`, `placedAt`, `status`, `paymentMethod`, and a single formatted `deliveryAddress` string. The cart is cleared when an `Order` is created, so the two never share state.
_Avoid_: Purchase, Transaction.

**OrderStatus**:
`pending` / `shipped` / `delivered` / `cancelled`. An order is `pending` the moment it is placed; nothing in the app advances it — the later states exist only on seeded demo orders.
_Avoid_: OrderState.

**ChatMessage**:
One turn in the Reading Assistant transcript: a `ChatRole` (`user` / `assistant`), the text, and optionally a `bookId` (renders an inline book card) or `quotes` (renders a price spread). The whole transcript is pre-written; the app never calls Gemini.
_Avoid_: Message (ambiguous with a future direct-messaging feature between P2P buyers and sellers).

**VendorQuote**:
A demo-only `{vendor, price, isBest}` triple used inside a `ChatMessage` price-spread table. Same status as the vendor demo fields on `Book`: the real schema stores one price per book, and cross-vendor comparison is a future extension (see ADR-0001).
_Avoid_: treating these as stable schema.
