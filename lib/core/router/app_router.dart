import 'package:go_router/go_router.dart';
import '../../presentation/pages/campsite_detail_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/map_page.dart';

class AppRouter {
  static const String home = '/';
  static const String map = '/map';
  static const String campsiteDetail = '/campsite/:id';

  static GoRouter get router => GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(path: map, builder: (context, state) => const MapPage()),
      GoRoute(
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
