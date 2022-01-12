import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/user_service.dart';

class SettingViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  String _uname = "Strange";
  String _role = "Customer";
  String _photoURL = "";

  String get image => 'lib/assets/home/dummy-avatar.png';
  String get uname => _uname;
  String get role => _role;
  String get photoURL => _photoURL;

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

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }
}
