import 'package:stacked/stacked.dart';

class BookViewModel extends BaseViewModel {
  final String _title = "book here";

  String get title => _title;

  static Future searchSeat(String start, String destination) async {
    print(start + " -> " + destination);
  }
}
