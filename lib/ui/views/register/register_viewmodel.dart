import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/user/user.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';
import 'package:transitspot/services/authentication_service.dart';

class RegisterViewModel extends FormViewModel {
  final String _title = 'Register View';
  String get title => _title;

  bool _isSignUp = true;
  bool get isSignUp => _isSignUp;

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  void setIsSignUp(bool state) {
    _isSignUp = state;
    notifyListeners();
  }

  void submit() async {
    if (emailValue != null &&
        passwordValue != null &&
        nameValue != null &&
        registerAsValue != null) {
      if (isSignUp) {
        await _authService.signUpWithEmail(
            email: emailValue!,
            password: passwordValue!,
            fullName: nameValue!,
            isDriver: registerAsValue == "driver");
      } else {
        await _authService.loginWithEmail(
            email: emailValue!, password: passwordValue!);
      }
      await _navigationService.navigateTo(Routes.homeView);
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future toHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
