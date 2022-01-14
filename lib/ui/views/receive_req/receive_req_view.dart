import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/ui/views/receive_req/receive_req_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/request/request.dart';

class ReceiveReqView extends StatelessWidget {
  final Request request;
  final String requestId;

  const ReceiveReqView(
      {Key? key, required this.request, required this.requestId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReceiveReqViewModel>.reactive(
      viewModelBuilder: () => ReceiveReqViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  model.navigatePage(Routes.homeView);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 35.0,
                ),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: HasLoginView(
          childWidget: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 180.0, 24.0, 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${request.customerName} has requested to follow you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.content,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8 - 16.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: change to live location
                                // model.navigatePage(Routes.acceptReqView);
                                model.acceptRequest(request, requestId);
                              },
                              child: Text(
                                'See Live Location',
                                style: TextStyle(
                                  color: AppColors.primaryBackground,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.darkSecondaryBackground),
                                elevation:
                                    MaterialStateProperty.all<double>(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
