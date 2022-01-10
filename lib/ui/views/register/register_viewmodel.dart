import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';

class RegisterViewModel extends FormViewModel {
  final String _title = 'Register View';
  String get title => _title;
  final _navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future toHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
