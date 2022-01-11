import 'dart:async';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SuccessViewModel extends BaseViewModel {
  Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }
}
