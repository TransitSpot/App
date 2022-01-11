// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/book/book_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/search_result/search_result_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String registerView = '/register-view';
  static const String homeView = '/home-view';
  static const String bookView = '/book-view';
  static const String searchResultView = '/search-result-view';
  static const all = <String>{
    startupView,
    registerView,
    homeView,
    bookView,
    searchResultView,
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
