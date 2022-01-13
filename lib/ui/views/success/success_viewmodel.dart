import 'dart:async';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class pageData {
  late String title;
  late String mainRoute;
  late String mainRouteTitle;
  late String? optionalRoute;
  late String backRoute;
  late bool hasOptionalRoute;
  late String? optionalRouteTitle;

  pageData(String kind) {
    switch (kind) {
      case 'TRANSACTION':
        title = 'Yeay! Transaksi berhasil diproses';
        mainRoute = Routes.homeView;
        mainRouteTitle = 'Back to Home';
        backRoute = Routes.bookView;
        hasOptionalRoute = false;
        break;
      case 'BOOK':
        title = 'Yeay! Pemesanan berhasil diproses';
        //TODO: change to live location
        mainRoute = Routes.onDemandView;
        mainRouteTitle = 'Share Live Location';
        optionalRoute = Routes.homeView;
        backRoute = Routes.onDemandView;
        hasOptionalRoute = true;
        optionalRouteTitle = 'or back to home';
        break;
      case 'REQUEST':
        title = 'Yeay! Your Request has been Accepted';
        mainRoute = Routes.onDemandView; //TODO: change to driver location
        mainRouteTitle = "See Driver's location";
        optionalRoute = Routes.homeView;
        backRoute = Routes.onDemandView; // TODO: check again route
        hasOptionalRoute = true;
        optionalRouteTitle = 'or back to home';
    }
  }
}

class SuccessViewModel extends BaseViewModel {
  Future navigatePage(String page) async {
    final _navigationService = locator<NavigationService>();
    await _navigationService.navigateTo(page);
  }

  late pageData dataPage;

  void init(String kind) {
    dataPage = pageData(kind);
  }
}
