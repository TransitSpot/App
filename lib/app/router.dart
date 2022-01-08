import 'package:auto_route/annotations.dart';
import 'package:pemilu_mobile/ui/views/home/home_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
  ],
)
class $AppRouter {}
