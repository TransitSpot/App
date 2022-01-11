import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/firestore_service.dart';
import 'package:transitspot/services/user_service.dart';
import 'package:transitspot/ui/views/book/book_view.dart';
import 'package:transitspot/ui/views/home/home_view.dart';
import 'package:transitspot/ui/views/register/register_view.dart';
import 'package:transitspot/ui/views/book/book_view.dart';
import 'package:transitspot/ui/views/search_result/search_result_view.dart';
import 'package:transitspot/ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: BookView),
    MaterialRoute(page: SearchResultView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: FirestoreService),
    Singleton(classType: AuthenticationService),
    Singleton(classType: UserService),
  ],
)
class App {}
