import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  String _title1 = 'Welcome back';
  String _title2 = 'Services';
  String _uname = "Strange";
  String _role = "Customer";
  String _photoURL = "";
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
      'destination': Routes.onDemandView,
    },
  ];
  final List<Map<String, String>> _srvDriver = [
    {
      'title': "Activate Services",
      'img': 'lib/assets/home/current_location.png',
      'destination': Routes.bookView,
    },
    {
      'title': "Receive Requests",
      'img': 'lib/assets/home/distance.png',
      'destination': Routes.receiveReqView,
    },
  ];

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }

  String get image => 'lib/assets/home/dummy-avatar.png';
  String get title1 => _title1;
  String get title2 => _title2;
  String get uname => _uname;
  String get role => _role;
  String get photoURL => _photoURL;
  List<Map<String, String>> get srvs =>
      (_role == 'Customer') ? _srvCustomer : _srvDriver;

  void logout() async {
    await _authService.logOut();
  }

  Future<void> getUserData() async {
    var firebaseUser = _authService.getCurrentUser()!;
    var userData = await _userService.getUserById(firebaseUser.uid);
    _uname = userData.name;
    _role = userData.isDriver ? "Driver" : "Customer";
    _photoURL = userData.photoUrl;
    notifyListeners();
  }
}
