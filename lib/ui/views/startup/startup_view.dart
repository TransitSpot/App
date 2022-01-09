import 'package:transitspot/app/locator.dart';
import 'package:transitspot/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future initialise() async {
    await _navigationService.replaceWith(const HomeView().path);
  }
}
