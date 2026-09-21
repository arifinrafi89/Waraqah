import 'package:go_router/go_router.dart';
import '../../core/widgets/placeholder_page.dart';
import '../../features/catalog/presentation/pages/catalog_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const PlaceholderPage(title: 'Login'),
      ),
      GoRoute(
        path: '/catalog',
        name: 'catalog',
        builder: (context, state) => const CatalogPage(),
      ),
      GoRoute(
        path: '/p2p',
        name: 'p2p',
        builder: (context, state) => const PlaceholderPage(title: 'P2P'),
      ),
      GoRoute(
        path: '/book-bites',
        name: 'book-bites',
        builder: (context, state) =>
            const PlaceholderPage(title: 'Book-Bites'),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const PlaceholderPage(title: 'Profile'),
      ),
      GoRoute(
        path: '/ai-chat',
        name: 'ai-chat',
        builder: (context, state) =>
            const PlaceholderPage(title: 'AI Chat'),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const PlaceholderPage(title: 'Cart'),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const PlaceholderPage(title: 'Search'),
      ),
    ],
  );
}
