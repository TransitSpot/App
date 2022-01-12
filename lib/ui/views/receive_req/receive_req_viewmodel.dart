import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReceiveReqViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }
}
