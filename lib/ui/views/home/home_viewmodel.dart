import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final String _title1 = 'Welcome back';
  final String _title2 = 'Services';
  final String _uname = "Strange";
  final String _role = "Customer";
  // TODO: Add your viewModel properties here
  final List<Map<String, String>> _srvCustomer = [
    {
      'title': "Book a Seat",
      'img': 'lib/assets/home/promo.png',
      'destination': Routes.bookView,
    },
    {
      'title': "Find on Demand",
      'img': 'lib/assets/home/distance.png',
      'destination': Routes.bookView,
    },
  ];
  final List<Map<String, String>> _srvDriver = [
    {
      'title': "Activate Services",
      'img': 'lib/assets/home/current_location.png',
      'destination': Routes.bookView,
    },
    {
      'title': "Open Map",
      'img': 'lib/assets/home/distance.png',
      'destination': Routes.bookView,
    },
  ];

  String get image => 'lib/assets/home/dummy-avatar.png';
  String get title1 => _title1;
  String get title2 => _title2;
  String get uname => _uname;
  String get role => _role;
  List<Map<String, String>> get srvs =>
      (_role == 'Customer') ? _srvCustomer : _srvDriver;

  static Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }

  void logout() async {
    await _authService.logOut();
  }
}
