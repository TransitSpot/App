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
        this.title = 'Yeay! Transaksi berhasil diproses';
        this.mainRoute = Routes.homeView;
        this.mainRouteTitle = 'Back to Home';
        this.backRoute = Routes.bookView;
        this.hasOptionalRoute = false;
        break;
      case 'BOOK':
        this.title = 'Yeay! Pemesanan berhasil diproses';
        //TODO: change to live location
        this.mainRoute = Routes.onDemandView;
        this.mainRouteTitle = 'Share Live Location';
        this.optionalRoute = Routes.homeView;
        this.backRoute = Routes.onDemandView;
        this.hasOptionalRoute = true;
        this.optionalRouteTitle = 'or back to home';
        break;
      case 'REQUEST':
        this.title = 'Yeay! Your Request has been Accepted';
        this.mainRoute = Routes.onDemandView; //TODO: change to driver location
        this.mainRouteTitle = "See Driver's location";
        this.optionalRoute = Routes.homeView;
        this.backRoute = Routes.onDemandView; // TODO: check again route
        this.hasOptionalRoute = true;
        this.optionalRouteTitle = 'or back to home';
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
