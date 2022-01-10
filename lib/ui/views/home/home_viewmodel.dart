import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final String _title1 = 'Welcome back';
  final String _title2 = 'Services';
  final String _uname = "Stephen Strange";
  final String _role = "Customer";
  final List<Map<String, String>> _srvCustomer = [
    {
      'title': "Book a Seat",
      'img': 'lib/assets/home/promo.png',
    },
    {
      'title': "Find on Demand",
      'img': 'lib/assets/home/distance.png',
    },
  ];
  final List<Map<String, String>> _srvDriver = [
    {
      'title': "Activate Services",
      'img': 'lib/assets/home/current_location.png',
    },
    {
      'title': "Open Map",
      'img': 'lib/assets/home/distance.png',
    },
  ];

  String get image => 'lib/assets/home/dummy-avatar.png';
  String get title1 => _title1;
  String get title2 => _title2;
  String get uname => _uname;
  String get role => _role;
  List<Map<String, String>> get srvs =>
      (_role == 'Customer') ? _srvCustomer : _srvDriver;
}
