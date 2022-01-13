import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/ui/views/search_result/search_result_viewmodel.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:transitspot/ui/views/search_result/components/card_result.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';

class SearchResultView extends StatelessWidget {
  final String start;
  final String destination;

  const SearchResultView({
    Key? key,
    required this.start,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchResultViewModel>.reactive(
      onModelReady: (viewModel) => {viewModel.getData(start, destination)},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  model.navigatePage(Routes.bookView);
                },
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: HasLoginView(
          childWidget: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                const SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16.0,
                  ),
                  child: FutureBuilder<List<SearchResultData>>(
                      future: model.searchRes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
                            child: Column(
                              children: snapshot.data!.map(
                                (datum) {
                                  return CardResult(
                                    data: datum,
                                    hasButton: true,
                                    book: model.book,
                                  );
                                },
                              ).toList(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return const CircularProgressIndicator();
                      }),
                )
              ]),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SearchResultViewModel(),
    );
  }
}
