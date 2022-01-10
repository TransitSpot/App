import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/ui/views/book/book_viewmodel.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class BookView extends StatelessWidget {
  BookView({Key? key}) : super(key: key);
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  _navigationService.navigateTo(Routes.homeView);
                },
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //     child: const Icon(Icons.arrow_back_ios,
        //         color: Colors.black, size: 10.0),
        //     backgroundColor: AppColors.primaryBackground,
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: HasLoginView(
          childWidget: SafeArea(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset:
                          Offset(5.0, 8.0), // shadow direction: bottom right
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text('Book a Seat',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500)),
                    Divider(
                      color: AppColors.secondaryBackground,
                      thickness: 5.0,
                      height: 20.0,
                      indent: MediaQuery.of(context).size.width * 0.35,
                      endIndent: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Input Tempat Awal',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Type here...',
                              errorStyle: TextStyle(height: 0),
                            ),
                            onSaved: (value) {
                              print(value);
                            },
                            validator: (value) {},
                          ),
                          const SizedBox(height: 16.0),
                          const Text('Input Tujuan',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Type here...',
                              errorStyle: TextStyle(height: 0),
                            ),
                            onSaved: (value) {
                              print(value);
                            },
                            validator: (value) {},
                          ),
                          const SizedBox(height: 24.0),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: ElevatedButton(
                                  onPressed: () {
                                    print("searching...");
                                  },
                                  child: Text('Search',
                                      style: TextStyle(
                                          color: AppColors.content,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w700)),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.secondaryBackground),
                                    elevation:
                                        MaterialStateProperty.all<double>(4.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => BookViewModel(),
    );
  }
}
