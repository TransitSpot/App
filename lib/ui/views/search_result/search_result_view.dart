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
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                                5.0, 8.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 20.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Menampilkan hasil pencarian dari $start ke $destination',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                                color: AppColors.content,
                              ),
                            ),
                            Divider(
                              color: AppColors.secondaryBackground,
                              thickness: 5.0,
                              height: 20.0,
                              indent: MediaQuery.of(context).size.width * 0.35,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.35,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                              height: 20.0,
                            ),
                            FutureBuilder<List<SearchResultData>>(
                                future: model.searchRes,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 12.0),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SearchResultViewModel(),
    );
  }
}
