import 'package:auto_route/annotations.dart';
import 'package:transitspot/ui/views/home/home_view.dart';
import 'package:transitspot/ui/views/register/register_view.dart';
import 'package:transitspot/ui/views/startup/startup_viewmodel.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StartupView, initial: true),
    AutoRoute(page: HomeView),
    AutoRoute(page: RegisterView),
  ],
)
class $AppRouter {}
