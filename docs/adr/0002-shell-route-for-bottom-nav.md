# Bottom nav lives in a GoRouter StatefulShellRoute, not per-page

The bottom nav (`AppBottomNav`) was originally embedded as a `Positioned` widget inside each top-level page's own `Scaffold`/`Stack`, wired to `context.pushNamed`. This meant every tab implemented nav rendering and layout (padding, `extendBody`) itself, tap targets pushed a new route onto the stack (so tab-hopping grew the back stack indefinitely), and switching tabs reset each page's scroll position.

We moved the five top-level tab routes (`/home`, `/catalog`, `/p2p`, `/book-bites`, `/profile`) under a single `StatefulShellRoute.indexedStack` in `AppRouter`. `AppBottomNav` now renders once, at the shell level, driven by `navigationShell.currentIndex`/`goBranch`. Non-tab routes (`/login`, `/cart`, `/search`, `/ai-chat`) stay outside the shell as ordinary pushed routes and correctly show no bottom nav.

Trade-off: pages nested in the shell now sit inside two `Scaffold`s (shell + page), which widget tests need to account for (see `test/placeholder_page_test.dart`). Accepted in exchange for one nav implementation, tab-style back-stack behavior, and per-tab scroll-position retention.
