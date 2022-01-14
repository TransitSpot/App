import 'package:stacked/stacked.dart';

class DriverStateService with ReactiveServiceMixin {
  DriverStateService() {
    listenToReactiveValues([
      _acceptedRequestsId,
    ]);
  }

  ReactiveValue<List<String>> _acceptedRequestsId =
      ReactiveValue<List<String>>([]);
  List<String> get acceptedRequestsId => _acceptedRequestsId.value;

  void addAcceptedRequestId(String id) {
    _acceptedRequestsId.value.add(id);
  }

  void deleteByRequestId(String id) {
    _acceptedRequestsId.value.remove(id);
  }
}
