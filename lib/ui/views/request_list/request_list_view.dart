import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/request_list/request_list_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transitspot/services/request_service.dart';

class RequestListView extends StatelessWidget {
  RequestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestListViewModel>.reactive(
      onModelReady: (viewModel) async {
        await viewModel.getData();
        await viewModel.broadcastPosition();
      },
      onDispose: (model) => model.googleMapController.dispose(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              initialCameraPosition:
                  model.getCameraPosition(model.currentLatLng),
              onMapCreated: (controller) async {
                await model.updateLatLng();
                model.setGoogleMapController(controller);
                model.updateCameraPositionToCurrentPos();
                model.getCurrentPositionAsMarker();
              },
              markers: {
                if (model.markers['initial'] != null) model.markers['initial']!,
                if (model.markers['destination'] != null)
                  model.markers['destination']!,
              },
              polylines: {
                if (model.directionsInfo != null)
                  Polyline(
                    polylineId: const PolylineId('overview_polyline'),
                    color: Colors.blue,
                    width: 5,
                    points: model.directionsInfo!.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
            ),
          ],
        ),
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
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 50.0,
                        ),
                        const Divider(),
                        StreamBuilder<QuerySnapshot>(
                          stream: model.requestStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text(
                                  'Something went wrong: ${snapshot.error}');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }

                            return SingleChildScrollView(
                              child: Column(
                                children: snapshot.data!.docs.map(
                                  (DocumentSnapshot datum) {
                                    Request request = datum.data()! as Request;
                                    String requestId = datum.id;

                                    return GestureDetector(
                                      onTap: () {
                                        model.seeRequest(
                                          request,
                                          requestId,
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              request.customerName,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("See Request"),
            color: AppColors.darkSecondaryBackground,
            textColor: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
      viewModelBuilder: () => RequestListViewModel(),
    );
  }
}
