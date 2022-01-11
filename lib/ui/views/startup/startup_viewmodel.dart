import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/user_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  Future initialise() async {
    if (_authService.isUserLoggedIn()) {
      var user = _authService.getCurrentUser()!;
      if (await _userService.checkIfUserADriverById(user.uid)) {
        await _navigationService.navigateTo(Routes.homeView);
      } else {
        await _navigationService.navigateTo(Routes.homeView);
      }
    } else {
      await _navigationService.navigateTo(Routes.registerView);
    }
  }
}
