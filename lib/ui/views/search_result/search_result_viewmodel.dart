import 'dart:async';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchResultData {
  final String date;
  final String time;
  final String price;
  final String start;
  final String destination;

  SearchResultData({
    required this.start,
    required this.destination,
    required this.date,
    required this.time,
    required this.price,
  });
}

Future<List<SearchResultData>> search(String start, String destination) async {
  final data = [
    SearchResultData(
        start: start,
        destination: destination,
        date: '2020-01-01',
        time: '10:00',
        price: 'Rp. 100.000'),
    SearchResultData(
        start: start,
        destination: destination,
        date: '2020-01-01',
        time: '10:00',
        price: 'Rp. 100.000'),
    SearchResultData(
        start: start,
        destination: destination,
        date: '2020-01-01',
        time: '10:00',
        price: 'Rp. 100.000'),
  ];
  return data;
}

class SearchResultViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final String _start = '';
  final String _destination = '';
  Future<List<SearchResultData>>? searchRes;

  String get start => _start;
  String get destination => _destination;

  Future getData(String start, String destination) async {
    setBusy(true);
    print(start);
    print(destination);
    searchRes = search(start, destination);
    setBusy(false);
  }

  Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }
}
