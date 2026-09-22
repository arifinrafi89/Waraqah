import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/placeholder_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/book_bites/presentation/pages/book_bites_page.dart';
import '../../features/book_bites/presentation/pages/create_post_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/catalog/presentation/pages/book_detail_page.dart';
import '../../features/catalog/presentation/pages/catalog_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/p2p/presentation/pages/create_listing_page.dart';
import '../../features/p2p/presentation/pages/p2p_detail_page.dart';
import '../../features/p2p/presentation/pages/p2p_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => Scaffold(
          body: Stack(
            children: [
              navigationShell,
              AppBottomNav(
                currentIndex: navigationShell.currentIndex,
                onTap: navigationShell.goBranch,
              ),
            ],
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                name: 'catalog',
                builder: (context, state) => const CatalogPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/p2p',
                name: 'p2p',
                builder: (context, state) => const P2pPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/book-bites',
                name: 'book-bites',
                builder: (context, state) => const BookBitesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/catalog/book/:id',
        name: 'book-detail',
        builder: (context, state) =>
            BookDetailPage(bookId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/book-bites/create',
        name: 'book-bites-create',
        builder: (context, state) => const CreatePostPage(),
      ),
      GoRoute(
        path: '/p2p/create',
        name: 'p2p-create',
        builder: (context, state) => const CreateListingPage(),
      ),
      GoRoute(
        path: '/p2p/:id',
        name: 'p2p-detail',
        builder: (context, state) =>
            P2pDetailPage(listingId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/ai-chat',
        name: 'ai-chat',
        builder: (context, state) => const PlaceholderPage(title: 'AI Chat'),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrdersPage(),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const PlaceholderPage(title: 'Search'),
      ),
    ],
  );
}
