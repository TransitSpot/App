import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/datamodels/request/request.dart';

class ReceiveReqViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future acceptRequest(Request request) async {
    await _navigationService.navigateTo(
      Routes.acceptReqView,
      arguments: AcceptReqViewArguments(
        request: request,
      ),
    );
  }

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }
}
