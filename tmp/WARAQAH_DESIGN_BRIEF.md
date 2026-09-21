# Waraqah — Design Brief (for Claude Code / Flutter implementation)

Source of truth: `waraqah_mockup.html` in this same folder — a static HTML/CSS mockup of 4 screens. This brief extracts it into Flutter-usable specs. Read the HTML file too; class names below map 1:1 to it (search the file for the class name to see exact markup/spacing).

## Screens in the mockup
1. **Home** — `.frame-group` #1 — app bar, Daily Ayah card, Beneficial/Non-Beneficial filter chips, Book-Bites strip, New Books price-comparison grid, P2P strip, glass bottom nav, AI FAB.
2. **Log In / Sign Up** — `.frame-group` #2 — one screen, segmented tab switches between two forms.
3. **Catalog** — `.frame-group` #3 — search bar, category chips, sort/filter row, vertical book list rows.
4. **AI Reading Assistant** — `.frame-group` #4 — chat bubbles, one embedded book-recommendation card, suggested-prompt chips, input dock.

Frame size: 412×915 (dp), Android, no iOS conventions (no home indicator, no iOS tab bar).

## Color tokens — 6 themes

Implement as a `ThemeExtension<AppPalette>` (or 6 `ColorScheme`s) so the whole app can hot-swap; do not hardcode any of these as one-off widget colors.

| token | Forest (dark) | Nord (light) | Tokyo Night (dark) | Tokyo Day (light) | Catppuccin Mocha (dark) | Catppuccin Latte (light) |
|---|---|---|---|---|---|---|
| bg | #12160F | #ECEFF4 | #1A1B26 | #E1E2E7 | #1E1E2E | #EFF1F5 |
| surface | #1A2016 | #FFFFFF | #20222F | #F4F4F8 | #252537 | #FFFFFF |
| surface2 | #222B1C | #E5E9F0 | #292C3D | #D5D6DB | #313244 | #E6E9EF |
| border | #2B3524 | #D8DEE9 | #343850 | #C8C9D1 | #3D3E54 | #DBDFF0 |
| text | #E9F1E2 | #2E3440 | #C0CAF5 | #343B58 | #CDD6F4 | #4C4F69 |
| textDim | #A3B596 | #4C566A | #9099C4 | #565A6E | #A6ADC8 | #6C6F85 |
| textFaint | #6F8262 | #7A8496 | #565F89 | #767A8C | #6C7086 | #8C8FA1 |
| accent | #3FB464 | #5E81AC | #7AA2F7 | #2959AA | #CBA6F7 | #8839EF |
| accentInk (text-on-accent) | #06170C | #FFFFFF | #0F1220 | #FFFFFF | #1A1523 | #FFFFFF |
| accentSoft | #213826 | #DCE4EE | #2A3352 | #C8D4EE | #392F4A | #E9DCFB |
| chip1 | #3FB464 | #5E81AC | #7AA2F7 | #2959AA | #CBA6F7 | #8839EF |
| chip2 | #8BC6A0 | #88C0D0 | #BB9AF7 | #7550AA | #F5C2E7 | #EA76CB |
| chip3 | #D9C26A | #D08770 | #E0AF68 | #8C6C3E | #F9E2AF | #DF8E1D |
| chip4 | #6FA8DC | #A3BE8C | #9ECE6A | #587539 | #94E2D5 | #40A02B |

Theme switcher UX (mockup only, not required in the shipped app unless you want a debug/settings toggle): mode toggle (Light/Dark) + a family dropdown whose 3 options relabel per mode — dark → Forest / Tokyo Night / Mocha; light → Nord / Tokyo Day / Latte.

`chip1–4` are used to color placeholder book covers (rotate through them) — see "Book cover placeholders" below.

## Typography

Use `google_fonts` package for all three:

| role | font | weights used | notes |
|---|---|---|---|
| Wordmark / display ("Waraqah") | Reem Kufi | 500 | Latin+Arabic geometric font; used only for the wordmark and P2P cover title text |
| UI / body | Manrope | 400, 500, 600, 700, 800 | everything else — labels, buttons, prices, chips |
| Ayah Arabic text | Amiri | 400 | RTL, ~23px, line-height 1.9, only on the Daily Ayah card |

Numeric price text uses tabular figures (`FontFeature.tabularFigures()` in a `TextStyle`).

## Spacing / shape scale

- Screen side gutter: 18px
- Card radius: 16px · pill/chip radius: 999px · Ayah card radius: 20px · buttons/inputs: 12px
- Section vertical rhythm: 18–22px between sections
- Bottom nav: floating pill, 14px side inset from screen edge, 16px bottom inset, `BackdropFilter(blur: 18)` + ~55% opacity surface fill + 1px border — this is the "glass" look (there's no mature Flutter "liquid glass" package worth depending on for a 10-day project; hand-roll it with `BackdropFilter` + `ClipRRect`).
- AI FAB: 52×52, radius 18, sits 92px from bottom (clears the nav), 18px from right edge.

## Book cover placeholders

No real cover images. Each cover is a colored block: `LinearGradient` from `chipN` to a ~55%-darkened `chipN`, with the title text overlaid at the bottom over a dark scrim gradient. Rotate through chip1→chip4 across the list/grid. Same treatment for P2P and catalog-list thumbnails, just smaller.

## Screen-by-screen component list

### 1. Home
- Status bar (fake, decorative only — real app just uses system status bar)
- App bar: wordmark left, search + cart (with badge) icons right
- Ayah card: gradient (`accentSoft` → `surface`), Arabic text, italic translation, reference line — **static, same ayah every load** (Al-Baqarah 2:152)
- Filter chip row: All / Beneficial / Non-Beneficial (segmented, single-select)
- Book-Bites: horizontal `ListView`, cards with avatar+name+handle, post text, one `book-tag` chip
- New Books: section header + "Sort" action, 2-column `GridView` of book cards (cover, "Best" badge when it's the cross-vendor lowest price, author, price + struck-through original price if discounted, vendor badge)
- P2P: horizontal `ListView`, square cover with condition badge (Like New/Good/Fair), title, seller + batch, price
- Bottom nav: Home / Catalog / P2P / Bites / Profile (5 items, active = filled pill in `accent`)
- FAB: sparkle icon, opens AI Chat

### 2. Log In / Sign Up
- Centered wordmark + tagline, no app bar/back button
- Segmented tab (Log In active by default)
- Log In: email field, password field (obscure toggle icon), "Forgot password?" link right-aligned, primary button, "or continue with" divider, Google outline button
- Sign Up: full name, email, Student ID (optional), password, confirm password, terms checkbox, primary button
- Footer line switches text/tab based on which form is active

### 3. Catalog
- App bar: "Catalog" + book-count subtitle, filter icon
- Persistent search field (not just an icon — full-width bar)
- Category chip row (All / Islamic Studies / Academic / Fiction / Self-Help / Business)
- Result bar: result count + "Sort" pill + "Filter" pill
- Vertical list rows: thumbnail, title (1-line ellipsis), author, 2 tag chips (category + Beneficial/Non-Beneficial), star rating, price + "vs N vendors" vendor-count line
- Bottom nav present (Catalog tab active) + FAB present

### 4. AI Reading Assistant
- App bar: back button, small assistant avatar, "Reading Assistant" + "Powered by Gemini" subtitle, overflow menu
- No bottom nav (full-screen chat, reached via FAB / pushed route)
- Chat bubbles: AI (left, avatar, surface-colored, rounded except top-left corner) vs user (right, accent-filled, rounded except top-right corner)
- One AI bubble embeds a mini recommendation card (small cover block + title/author/price + "View in Catalog" link) — shows catalog-aware context injection
- One AI bubble shows a simple price-comparison list (vendor name + price, lowest row highlighted in `accent`)
- Suggested-prompt chip row above the input dock
- Input dock: rounded text field + mic icon + circular send button (`accent` fill)

## Suggested Claude Code prompt

Paste this into Claude Code once `waraqah_mockup.html` and this brief are both saved into the repo (e.g. under `design/`):

> Read `design/waraqah_mockup.html` and `design/WARAQAH_DESIGN_BRIEF.md` fully before writing any code — they're the source of truth for colors, type, spacing and layout for Waraqah's UI. Implement `lib/core/theme/app_theme.dart` first: all 6 color themes from the brief's token table as a `ThemeExtension<AppPalette>`, wired into `ThemeData`, with `google_fonts` for Reem Kufi / Manrope / Amiri. Then implement [screen name] under `lib/features/[feature]/presentation/`, matching the mockup's layout, spacing and component choices exactly — ask me before deviating from it. Use colored-gradient placeholder blocks for book covers, no real images. Follow the project's existing feature-based LEGO + Clean Architecture structure (presentation/domain/data per feature).

Do the theme file once, then one screen per prompt (swap `[screen name]` / `[feature]`) rather than all four at once — easier to review as a complete, acceptable-or-reject diff each time.
