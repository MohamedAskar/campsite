import 'package:go_router/go_router.dart';

import '../../presentation/pages/campsite_detail_page.dart';
import '../../presentation/pages/home/home_page.dart';

class AppRouter {
  static const String home = '/';
  static const String campsiteDetail = '/campsite/:id';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(
        name: 'campsite',
        path: campsiteDetail,
        builder: (context, state) {
          final campsiteId = state.pathParameters['id'];
          if (campsiteId == null) {
            return const HomePage(); // Fallback if no campsite ID
          }

          return CampsiteDetailPage(campsiteId: campsiteId);
        },
      ),
    ],
  );
}
