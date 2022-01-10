import 'package:stacked/stacked.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';

class RegisterViewModel extends FormViewModel {
  final String _title = 'Home View';
  String get title => _title;
  bool _isSignUp = true;
  bool get isSignUp => _isSignUp;

  void setIsSignUp(bool state) {
    _isSignUp = state;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
