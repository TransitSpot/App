import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';

class OrderViewModel extends FormViewModel {
  int _amountBook = 1;

  void incrementAmountBook() {
    _amountBook++;
    notifyListeners();
  }

  void decrementAmountBook() {
    if (_amountBook > 1) {
      _amountBook--;
      notifyListeners();
    }
  }

  int get amountBook => _amountBook;

  Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }

  static Future searchSeat(String start, String destination) async {
    print(start + " -> " + destination);
    const String page = Routes.searchResultView;
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(
      page,
      arguments: SearchResultViewArguments(
        start: start,
        destination: destination,
      ),
    );
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
