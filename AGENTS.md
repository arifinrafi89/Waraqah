# Agent Instructions & Guidelines for Waraqah

## 1. Project Overview
Waraqah is a dual-marketplace book platform built in Flutter/Dart targeting the Bangladesh market. It features:
- **Primary Marketplace:** Buy new physical books and ebooks sourced from Google Books API metadata, cross-edition price comparison, mock price fallback for unavailable sale data, and a simulated bKash checkout.
- **P2P Marketplace:** Peer-to-peer used book resale (Facebook Marketplace-style) with photo uploads, condition tags, and instant messaging via Supabase Realtime.
- **Authentication & Roles:** Managed by Supabase Auth with `user` and `admin` roles. Admin capabilities (order oversight, price override, moderation) are gated through the Go API.

---

## 2. Foundational Context Documents
Before making any changes or proposing implementations, agents **must** read and adhere to:
1. [PRD.md](file:///home/arifin/StudioProjects/waraqah/PRD.md) — Product requirements, scope boundaries, and data schemas.
2. [ARCHITECTURE.md](file:///home/arifin/StudioProjects/waraqah/ARCHITECTURE.md) — Module hierarchy, layer rules, naming conventions, and state flow.
3. [IMPLEMENTATION_PLAN.md](file:///home/arifin/StudioProjects/waraqah/IMPLEMENTATION_PLAN.md) — Phased task breakdown and execution checklist.

---

## 3. Testing & Verification Instructions
- **Format:** Always run `dart format .` before marking any task complete.
- **Analysis:** Always run `dart analyze` to ensure zero lint errors or warnings.
- **Automated Tests:** Always write and run tests (`flutter test`) for any new or modified domain logic, data mapping, or critical UI controllers.

---

## 4. MCP Servers Usage Instructions
Agents have access to specialized MCP servers. Use them proactively instead of guessing or searching outdated web sources:
- **Filesystem MCP:** Use for reading, searching, or batch-editing files when standard individual file operations are insufficient.
- **Git / GitHub MCP:** Use for inspecting commits, diffs, branch management, and PR reviews. Follow project git conventions.
- **pub.dev / Dart Package MCP:** Always query pub.dev via MCP **before** adding or upgrading any dependency to verify the latest version, supported SDK constraints, and current API signatures. Never guess package APIs from memory.
- **Android Emulator / ADB MCP:** Use to query connected devices, launch emulators, inspect Logcat logs for runtime crashes, and capture screenshots to verify UI changes.
- **Backend / Supabase MCP:** Use to inspect PostgreSQL database tables, review RLS policies, verify schema definitions, and execute database queries directly.

---

## 5. Lessons Learned & Self-Correction Log
Whenever an agent makes a mistake, encounters an unexpected error, or receives a correction, document the rule here to prevent future occurrences:

1. **Flutter PATH Resolution:** If the `flutter` or `dart` binary is not in the default non-login shell PATH on this Linux machine, ensure the shell environment or user PATH (`~/flutter/bin`, etc.) is referenced properly rather than guessing alternative installation locations.
2. **Scrollable Glass Blur Jank:** Never use `BackdropFilter` or blur-heavy containers inside scrollable lists or grids. Use token-driven solid/semi-transparent surfaces (`open_ui_kit`) to safeguard 60fps on mid-range Android hardware.
3. **Sensitive Data Protection:** The PIN entered during simulated bKash checkout must never be saved to persistent storage, database, or analytics logs. It must remain strictly ephemeral in memory.

---

## 6. Best Practices (Imperative Agent Rules)
- **File Placement:** Place each file strictly where it belongs by feature/module per [ARCHITECTURE.md](file:///home/arifin/StudioProjects/waraqah/ARCHITECTURE.md). Never dump files flat by type in global folders.
- **Reuse Before Creation:** Before writing a new widget, helper, or domain function, check `core/widgets/`, `core/theme/`, and relevant feature modules to reuse or extend existing components.
- **File Size Constraint:** Keep individual files under ~100–150 lines. Decompose large widgets and complex controllers into small, focused sub-widgets and helpers.
- **Clarity Over Cleverness:** Write explicit, readable, strongly-typed Dart. Avoid convoluted meta-programming or obfuscated shortcuts.
- **Scope Discipline:** Modify only the files strictly required for the current checklist item. Do not perform drive-by refactorings or alter unrelated features.
- **Regression Safety:** Prior to changing existing behavior, understand its current contract and ensure existing consumers and tests remain intact.

---

## 7. Environment & Setup Commands (Linux / Fedora & Android Studio)
Use these exact commands without variation:
- **Install dependencies:** `flutter pub get`
- **List devices/emulators:** `flutter devices`
- **Run the app:** `flutter run -d <device_id>`
- **Format code:** `dart format .`
- **Analyze/lint code:** `dart analyze`
- **Run unit/widget tests:** `flutter test`
- **Build debug APK:** `flutter build apk --debug`

---

## 8. Secrets & Configuration Handling
- **Zero Credentials in Code:** Never hardcode API keys, Supabase anon keys, service role keys, or credentials into source code or committed files.
- **Environment Files:** Store configuration in `.env` (loaded via `flutter_dotenv` or `--dart-define` / `--dart-define-from-file`).
- **Gitignore Protection:** Always verify that `.env` and local secrets are explicitly declared in `.gitignore`. Provide a `.env.example` file with dummy values for reference.

---

## 9. Task Execution Workflow (One Checklist Item at a Time)
1. **Focus:** Select and work on **one** logical checklist item from [IMPLEMENTATION_PLAN.md](file:///home/arifin/StudioProjects/waraqah/IMPLEMENTATION_PLAN.md) per turn. Do not start subsequent items until the current one is finished and verified.
2. **Quality Gate:** After implementation, execute:
   - `dart format .`
   - `dart analyze`
   - `flutter test` (relevant tests)
   - Visual or behavioral validation via emulator/device if applicable.
3. **Record Progress:** Mark the item complete (`[x]`) in [IMPLEMENTATION_PLAN.md](file:///home/arifin/StudioProjects/waraqah/IMPLEMENTATION_PLAN.md) and record any relevant implementation notes or architectural deviations next to it.
4. **User Checkpoint:** Present the completed item to the user and request confirmation before continuing.
5. **Proceed:** Once confirmed by the user, state the next checklist item clearly and begin execution.

---

## 10. Resuming Work & Project Onboarding
When picking up the project after a model switch, context reset, or session restart:
1. Read [PRD.md](file:///home/arifin/StudioProjects/waraqah/PRD.md), [ARCHITECTURE.md](file:///home/arifin/StudioProjects/waraqah/ARCHITECTURE.md), [IMPLEMENTATION_PLAN.md](file:///home/arifin/StudioProjects/waraqah/IMPLEMENTATION_PLAN.md), and this file ([AGENTS.md](file:///home/arifin/StudioProjects/waraqah/AGENTS.md)).
2. Inspect the current codebase and the checklist in [IMPLEMENTATION_PLAN.md](file:///home/arifin/StudioProjects/waraqah/IMPLEMENTATION_PLAN.md) to determine current progress.
3. Never re-implement or modify completed items unless explicitly requested by the user.
4. Resume execution directly at the first unchecked item in the checklist.

