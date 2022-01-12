import 'dart:async';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';

Future<List<SearchResultData>> search(String start, String destination) async {
  final data = [
    SearchResultData(
      start: start,
      destination: destination,
      date: '02 Jan 2022',
      time: '06.45 - 13.00',
      price: 'Rp. 100.000',
      id: '1',
      avail: 50,
      name: "Hogwarts Express",
    ),
    SearchResultData(
      start: start,
      destination: destination,
      date: '03 Jan 2022',
      time: '08.45 - 15.00',
      price: 'Rp. 80.000',
      id: '2',
      avail: 50,
      name: "Hogwarts Express",
    ),
    SearchResultData(
      start: start,
      destination: destination,
      date: '02 Jan 2022',
      time: '13.45 - 21.00',
      price: 'Rp. 170.000',
      id: '3',
      avail: 50,
      name: "Hogwarts Express",
    ),
  ];
  return data;
}

class SearchResultViewModel extends BaseViewModel {
  final String _start = '';
  final String _destination = '';
  Future<List<SearchResultData>>? searchRes;

  String get start => _start;
  String get destination => _destination;

  Future getData(String start, String destination) async {
    setBusy(true);
    searchRes = search(start, destination);
    setBusy(false);
  }

  Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }

  Future book(SearchResultData data) async {
    print(data);
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(
      Routes.orderView,
      arguments: OrderViewArguments(data: data),
    );
  }
}
