import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/ui/views/home/home_view.dart';
import 'package:transitspot/ui/views/register/register_view.dart';
import 'package:transitspot/ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    CustomRoute(page: RegisterView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
  ],
)
class App {}
