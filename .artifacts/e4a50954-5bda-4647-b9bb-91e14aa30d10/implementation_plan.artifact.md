# Implementation Plan: Futuristic Home Page & Base Architecture

This plan sets up the "Feature-Based LEGO Architecture" for Waraqah and implements a futuristic, high-performance Home Page.

## User Review Required

> [!IMPORTANT]
> I will be adding `go_router` and `google_fonts` to your `pubspec.yaml` to support the navigation and typography required for a futuristic look.

## Proposed Changes

### Dependencies & Configuration

#### [MODIFY] [pubspec.yaml](file:///home/arifin/StudioProjects/waraqah/pubspec.yaml)
* Add `go_router`, `google_fonts`, and `flutter_riverpod` (for state management of the Feature Controllers).
* Register any necessary assets for futuristic backgrounds.

---

### Core Layer (Shared UI & Logic)

#### [NEW] [app_theme.dart](file:///home/arifin/StudioProjects/waraqah/lib/core/theme/app_theme.dart)
* Define a modern "Emerald & Gold" palette using Material 3.
* Setup custom `CardTheme` with subtle shadows and rounded corners (24dp+).

#### [NEW] [glass_container.dart](file:///home/arifin/StudioProjects/waraqah/lib/core/widgets/glass_container.dart)
* A reusable widget for glassmorphic effects (blur + transparency).

---

### Home Feature

#### [NEW] [home_page.dart](file:///home/arifin/StudioProjects/waraqah/lib/features/home/presentation/pages/home_page.dart)
* **Header Section:** Modern greeting with the Daily Ayah in a glassmorphic card.
* **Search Bar:** Floating, futuristic search bar with an "AI" toggle.
* **Feature Grid:** Dynamic cards for Catalog, P2P, Book-Bites, and AI Chat.
* **Animations:** Subtle fade-ins and scale transitions using `flutter_animate` (to be added to dependencies).

#### [NEW] [ayah_card.dart](file:///home/arifin/StudioProjects/waraqah/lib/features/home/presentation/widgets/ayah_card.dart)
* A specialized widget for the "Daily Ayah" featuring elegant Arabic typography.

---

### App Wiring

#### [NEW] [app_router.dart](file:///home/arifin/StudioProjects/waraqah/lib/app/router/app_router.dart)
* Initialize `GoRouter` with the `/home` route.

#### [MODIFY] [main.dart](file:///home/arifin/StudioProjects/waraqah/lib/main.dart)
* Clean up boilerplate and point to `WaraqahApp`.

## Verification Plan

### Manual Verification
* Inspect UI on a simulator/device to ensure glassmorphism looks correct.
* Verify that the Material 3 theme colors align with the "Futuristic Islamic" aesthetic.
* Test navigation between the stubbed feature pages.
