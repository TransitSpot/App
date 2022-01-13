// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../datamodels/request/request.dart';
import '../datamodels/search_result_data/search_result_data.dart';
import '../ui/views/accept_req/accept_req_view.dart';
import '../ui/views/book/book_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/ondemand/ondemand_view.dart';
import '../ui/views/order/order_view.dart';
import '../ui/views/receive_req/receive_req_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/request_list/request_list_view.dart';
import '../ui/views/search_result/search_result_view.dart';
import '../ui/views/setting/setting_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/success/success_view.dart';

class Routes {
  static const String startupView = '/';
  static const String registerView = '/register-view';
  static const String homeView = '/home-view';
  static const String bookView = '/book-view';
  static const String searchResultView = '/search-result-view';
  static const String orderView = '/order-view';
  static const String successView = '/success-view';
  static const String onDemandView = '/on-demand-view';
  static const String settingView = '/setting-view';
  static const String receiveReqView = '/receive-req-view';
  static const String requestListView = '/request-list-view';
  static const String acceptReqView = '/accept-req-view';
  static const all = <String>{
    startupView,
    registerView,
    homeView,
    bookView,
    searchResultView,
    orderView,
    successView,
    onDemandView,
    settingView,
    receiveReqView,
    requestListView,
    acceptReqView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.bookView, page: BookView),
    RouteDef(Routes.searchResultView, page: SearchResultView),
    RouteDef(Routes.orderView, page: OrderView),
    RouteDef(Routes.successView, page: SuccessView),
    RouteDef(Routes.onDemandView, page: OnDemandView),
    RouteDef(Routes.settingView, page: SettingView),
    RouteDef(Routes.receiveReqView, page: ReceiveReqView),
    RouteDef(Routes.requestListView, page: RequestListView),
    RouteDef(Routes.acceptReqView, page: AcceptReqView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      var args = data.getArgs<RegisterViewArguments>(
        orElse: () => RegisterViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    BookView: (data) {
      var args = data.getArgs<BookViewArguments>(
        orElse: () => BookViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => BookView(key: args.key),
        settings: data,
      );
    },
    SearchResultView: (data) {
      var args = data.getArgs<SearchResultViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchResultView(
          key: args.key,
          start: args.start,
          destination: args.destination,
        ),
        settings: data,
      );
    },
    OrderView: (data) {
      var args = data.getArgs<OrderViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrderView(
          key: args.key,
          data: args.data,
        ),
        settings: data,
      );
    },
    SuccessView: (data) {
      var args = data.getArgs<SuccessViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SuccessView(
          key: args.key,
          pageKind: args.pageKind,
        ),
        settings: data,
      );
    },
    OnDemandView: (data) {
      var args = data.getArgs<OnDemandViewArguments>(
        orElse: () => OnDemandViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnDemandView(key: args.key),
        settings: data,
      );
    },
    SettingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingView(),
        settings: data,
      );
    },
    ReceiveReqView: (data) {
      var args = data.getArgs<ReceiveReqViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReceiveReqView(
          key: args.key,
          request: args.request,
        ),
        settings: data,
      );
    },
    RequestListView: (data) {
      var args = data.getArgs<RequestListViewArguments>(
        orElse: () => RequestListViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RequestListView(key: args.key),
        settings: data,
      );
    },
    AcceptReqView: (data) {
      var args = data.getArgs<AcceptReqViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AcceptReqView(
          key: args.key,
          request: args.request,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegisterView arguments holder class
class RegisterViewArguments {
  final Key? key;
  RegisterViewArguments({this.key});
}

/// BookView arguments holder class
class BookViewArguments {
  final Key? key;
  BookViewArguments({this.key});
}

/// SearchResultView arguments holder class
class SearchResultViewArguments {
  final Key? key;
  final String start;
  final String destination;
  SearchResultViewArguments(
      {this.key, required this.start, required this.destination});
}

/// OrderView arguments holder class
class OrderViewArguments {
  final Key? key;
  final SearchResultData data;
  OrderViewArguments({this.key, required this.data});
}

/// SuccessView arguments holder class
class SuccessViewArguments {
  final Key? key;
  final String pageKind;
  SuccessViewArguments({this.key, required this.pageKind});
}

/// OnDemandView arguments holder class
class OnDemandViewArguments {
  final Key? key;
  OnDemandViewArguments({this.key});
}

/// ReceiveReqView arguments holder class
class ReceiveReqViewArguments {
  final Key? key;
  final Request request;
  ReceiveReqViewArguments({this.key, required this.request});
}

/// RequestListView arguments holder class
class RequestListViewArguments {
  final Key? key;
  RequestListViewArguments({this.key});
}

/// AcceptReqView arguments holder class
class AcceptReqViewArguments {
  final Key? key;
  final Request request;
  AcceptReqViewArguments({this.key, required this.request});
}
