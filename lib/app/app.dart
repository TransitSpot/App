import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:places_service/places_service.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/firestore_service.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'package:transitspot/services/user_service.dart';
import 'package:transitspot/ui/views/book/book_view.dart';
import 'package:transitspot/ui/views/home/home_view.dart';
import 'package:transitspot/ui/views/register/register_view.dart';
import 'package:transitspot/ui/views/search_result/search_result_view.dart';
import 'package:transitspot/ui/views/startup/startup_view.dart';
import 'package:transitspot/ui/views/order/order_view.dart';
import 'package:transitspot/ui/views/success/success_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: BookView),
    MaterialRoute(page: SearchResultView),
    MaterialRoute(page: OrderView),
    MaterialRoute(page: SuccessView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: PlacesService),
    Singleton(classType: UserService),
    Singleton(classType: GeolocatorService),
  ],
)
class App {}
