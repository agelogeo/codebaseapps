import 'package:go_router/go_router.dart';
import '../features/codebase/index_page.dart';
import '../features/codebase/not_found_page.dart';
import '../features/occ/occ_page.dart';
import '../features/occ/occ_privacy_page.dart';
import '../features/occ/occ_terms_page.dart';
import '../features/keibo/keibo_page.dart';
import '../features/keibo/keibo_join_page.dart';
import '../features/keibo/keibo_privacy_page.dart';
import '../features/keibo/keibo_terms_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(path: '/', builder: (context, state) => const IndexPage()),
    GoRoute(path: '/occ', builder: (context, state) => const OccPage()),
    GoRoute(
      path: '/occ/privacy',
      builder: (context, state) => const OccPrivacyPage(),
    ),
    GoRoute(
      path: '/occ/terms',
      builder: (context, state) => const OccTermsPage(),
    ),
    GoRoute(path: '/keibo', builder: (context, state) => const KeiboPage()),
    GoRoute(
      path: '/keibo/join',
      builder: (context, state) => const KeiboJoinPage(),
    ),
    GoRoute(
      path: '/keibo/privacy',
      builder: (context, state) => const KeiboPrivacyPage(),
    ),
    GoRoute(
      path: '/keibo/terms',
      builder: (context, state) => const KeiboTermsPage(),
    ),
  ],
);
