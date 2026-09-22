# Add /ai-chat Reading Assistant page (scripted, no backend)

`/ai-chat` is currently a `PlaceholderPage`, already reachable from the Home
page (`home_page.dart:623`). This issue builds the Reading Assistant screen to
match the supplied mockup.

**Depends on:** `docs/plans/01-cart.md` (`CenteredContent`, `taka()`, the
`GlassContainer` palette fix).

## Scope

There is no backend and no Gemini call. The app must never hold the Gemini API
key (`ARCHITECTURE.md` §10); in the eventual design a Supabase Edge Function
proxies it. For this demo the whole conversation is pre-written local data.

The text input and the mic button are rendered but **disabled**, with a "Coming
soon" hint — an input that accepts text and replies with nonsense is worse in
front of an audience than one that is honestly switched off.

The suggestion chips **are** live: tapping one appends its own pre-written
question-and-answer pair to the transcript. That is the interactive moment worth
demoing.

## Files

- `lib/features/ai_assistant/domain/models/chat_message.dart`:
  ```dart
  enum ChatRole { user, assistant }

  /// A single turn in the Reading Assistant transcript.
  class ChatMessage {
    final ChatRole role;
    final String text;
    final String? bookId;        // renders an inline book card under the text
    final List<VendorQuote>? quotes;  // renders an inline price-spread table
  }

  /// Demo-only. The real schema stores one price per book; cross-vendor
  /// comparison is a future extension (see docs/adr/0001).
  class VendorQuote {
    final String vendor;
    final double price;
    final bool isBest;
  }
  ```
- `lib/features/ai_assistant/data/dummy_chat_repository.dart` — the opening transcript plus the canned reply for each suggestion chip.
- `lib/features/ai_assistant/presentation/controllers/chat_controller.dart` — `chatMessagesProvider` (`StateProvider<List<ChatMessage>>`) seeded with the opening transcript, and `sendSuggestion(ref, Suggestion s)` which appends the user turn then the assistant turn.
- `lib/features/ai_assistant/presentation/pages/ai_chat_page.dart`
- `lib/features/ai_assistant/presentation/widgets/chat_bubble.dart`
- `lib/features/ai_assistant/presentation/widgets/inline_book_card.dart`
- `lib/features/ai_assistant/presentation/widgets/vendor_quote_table.dart`

## Layout

The mockup is a phone frame, but the app is being demoed on desktop. Wrap the
whole body in `CenteredContent` (`maxWidth: 720`) so on a wide window the
conversation is a centred column rather than bubbles stretched across 1400px.
Bubbles cap at 78% of that column's width. At phone width nothing changes.

**App bar** — custom, not a plain `AppBar` title: a back button, then a 36px
rounded-square avatar filled `palette.accent` holding `Icons.auto_awesome` in
`palette.accentInk`, then a two-line block — "Reading Assistant" in
`palette.text` at `FontWeight.w800`, "Powered by Gemini" beneath in
`palette.textDim` at `fontSize: 12`. A trailing overflow `IconButton`
(`Icons.more_vert_rounded`) with a single "Clear chat" item that resets
`chatMessagesProvider` to the seed.

**Transcript** — a `ListView` of `ChatBubble`s, bottom-anchored, that
auto-scrolls to the end when a message is appended.

- Assistant turn: aligned left, preceded by a 26px `palette.accentSoft` circle holding `Icons.auto_awesome` in `palette.accent`. Bubble filled `palette.surface`, outlined `palette.border`, 14px radius with the bottom-left corner tightened to 4px. Text in `palette.text`.
- User turn: aligned right, no avatar. Bubble filled `palette.accent`, text `palette.accentInk`, 14px radius with the bottom-right corner tightened to 4px.

**Inline book card** (`ChatMessage.bookId` non-null) — nested inside the
assistant bubble on `palette.surface2` with a 10px radius: a 44×58 cover
placeholder using the `chip` gradient rotation, then title in `palette.text`
`FontWeight.w700`, `author · ৳price` in `palette.textDim` at `fontSize: 12`,
then a "View in Catalog ›" row in `palette.accent`. The whole card is tappable
and pushes `/catalog/book/:id` for that `bookId`. Look the book up from
`booksProvider` — do not duplicate its title or price into the canned message
text, so the card never contradicts the catalog.

**Vendor quote table** (`ChatMessage.quotes` non-null) — nested on
`palette.surface2`, one row per quote: vendor name left, price right. The
`isBest` row renders both in `palette.accent`; the rest use `palette.text`.

**Suggestion chips** — a horizontally scrolling row directly above the input
bar. Each chip: emoji + label, `palette.surface` fill, `palette.border` outline,
pill radius, label in `palette.text`. Three chips, matching the mockup: "📚
Recommend a book", "💰 Compare prices", "🕌 Beneficial picks". A chip is
consumed on tap — hide it once used, so tapping it twice cannot duplicate the
same exchange.

**Input bar** — `GlassContainer` pinned to the bottom holding a disabled
`TextField` (hint "Ask about any book…" in `palette.textFaint`), a disabled
mic `IconButton` in `palette.textFaint`, and a circular send button filled
`palette.accent` with `Icons.arrow_forward_rounded` in `palette.accentInk`, also
disabled. Tapping anywhere in the bar shows a `SnackBar`: "Free-text chat
arrives with the backend." Do not fake the disabled look with opacity — set
`enabled: false` / `onPressed: null` so it is genuinely inert.

## Seed transcript

Follow the mockup, referencing real books from `DummyBookRepository` (add
*The Sealed Nectar* to the dummy catalog if it is not already there, so the
inline card resolves):

1. Assistant: "Assalamu alaikum! I'm your reading assistant. Tell me what you're in the mood for, or ask me to compare prices across vendors."

The three chip replies then supply: a Beneficial-tagged recommendation with an
inline book card; a three-vendor price spread with the cheapest highlighted; and
a short list of Beneficial picks.

## Routing

Replace the `/ai-chat` `PlaceholderPage` in `lib/app/router/app_router.dart`
with `AiChatPage`. It stays outside the `StatefulShellRoute` — pushed from Home,
keeps its back button, no bottom nav.

## Theming rules

Every colour from `AppPalette`. No `Color(0x...)` literals, no `Colors.*`. The
mockup is drawn in the Forest dark theme, so the accent-green user bubbles come
out of `palette.accent` for free — but check a light family (Nord) too, where
`accentInk` flips to white and the bubble contrast has to still hold.

## Acceptance criteria

- The page opens on the seeded greeting with all three chips available.
- Tapping a chip appends a user turn and an assistant turn, auto-scrolls to them, and removes that chip.
- The inline book card navigates to the correct `/catalog/book/:id`.
- Title and price on the inline card come from `booksProvider`, not from hardcoded strings.
- The text field and mic are genuinely disabled and explain why when tapped.
- On a 1400px-wide window the conversation is a centred column, not full-bleed.
- Correct in all six theme families.
- `flutter analyze` is clean.
