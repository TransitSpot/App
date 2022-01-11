import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';

class OrderViewModel extends BaseViewModel {
  final String _title = "book here";

  String get title => _title;

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
}
