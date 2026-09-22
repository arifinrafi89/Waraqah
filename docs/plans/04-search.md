# Add /search page with live catalog filtering

`/search` is currently a `PlaceholderPage`, already reachable from the search
icon in the Home app bar (`home_page.dart:158-161`). This issue makes it real.

**Depends on:** `docs/plans/01-cart.md` (`CenteredContent`, `taka()`, and the
wired-up `onAddToCart` the grid card gains there).

## Scope

Catalog books only. No tabs across P2P and Book-Bites — books are the point of
the demo and tabs would triple the UI. The search runs over the in-memory
`booksProvider` list; there is no backend and no network call.

## Files

- `lib/features/search/presentation/controllers/search_controller.dart`:
  - `searchQueryProvider` — `StateProvider<String>`, defaults to `''`.
  - `searchResultsProvider` — `Provider<List<Book>>` filtering `booksProvider` on a case-insensitive substring match against `title`, `author` and `genre`. Returns an empty list for an empty query (the page shows the idle state instead).
- `lib/features/search/presentation/pages/search_page.dart`

## Page layout

`Scaffold`, body inside `CenteredContent`.

The `AppBar` holds the search field directly rather than a title: a
`TextField` with `autofocus: true`, hint "Search books, authors, genres…" in
`palette.textFaint`, a leading `Icons.search_rounded` in `palette.textDim`, a
trailing clear button that appears only when the query is non-empty, filled with
`palette.surface`, outlined with `palette.border`, 12px radius. Wire
`onChanged` straight to `searchQueryProvider` — filtering an in-memory list of
this size needs no debounce.

Body has three states:

1. **Idle** (empty query) — a "Popular genres" chip row built from the distinct `genre` values in `booksProvider`, using the `chip1`-`chip4` rotation. Tapping a chip sets the query to that genre, which makes the empty state demonstrate the feature instead of sitting blank.
2. **Results** — a `ResponsiveBookGrid` of `BookGridCard`s, reusing `lib/core/widgets/responsive_book_grid.dart` exactly as `catalog_page.dart` does, with a "N results" count line above it in `palette.textDim`. Cards keep their add-to-cart button and their tap-through to `/catalog/book/:id`.
3. **No matches** — centred `Icons.search_off_rounded` in `palette.textFaint` plus "No books match \"<query>\"" in `palette.textDim`.

## Routing

Replace the `/search` `PlaceholderPage` in `lib/app/router/app_router.dart`
with `SearchPage`. It stays outside the `StatefulShellRoute` — it is pushed, so
the back button returns to Home.

Note that `/search` is not in the route list in `ARCHITECTURE.md` §8. Add it
there as part of this issue.

## Theming rules

Every colour from `AppPalette`. No `Color(0x...)` literals, no `Colors.*`. The
search field's focused and enabled borders should come from the `ThemeData` in
`lib/core/theme/app_theme.dart` where possible, so the checkout form's fields
and this field look identical.

## Acceptance criteria

- Typing filters the grid on every keystroke with no perceptible lag.
- Matching is case-insensitive and hits author and genre, not just title.
- The clear button empties the query and returns to the idle state.
- Add-to-cart works from a search result card.
- Correct in all six theme families.
- `flutter analyze` is clean.
