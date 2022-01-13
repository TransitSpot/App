import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/accept_req/accept_req_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/app/app.router.dart';

class AcceptReqView extends StatelessWidget {
  final Request request;

  const AcceptReqView({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AcceptReqViewModel>.reactive(
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
                  if (model.markers['initial'] != null)
                    model.markers['initial']!,
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
                          .map(
                            (e) => LatLng(
                              e.latitude,
                              e.longitude,
                            ),
                          )
                          .toList(),
                    ),
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (model.directionsInfo == null) {
                model.updateCameraPositionToCurrentPos();
              } else {
                model.googleMapController.animateCamera(
                  CameraUpdate.newLatLngBounds(
                      model.directionsInfo!.bounds, 100),
                );
              }
            },
            backgroundColor: AppColors.primaryBackground,
            child: const Icon(
              Icons.center_focus_strong,
              color: Colors.black,
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8),
            child: MaterialButton(
              onPressed: () {
                model.navigatePage(Routes.requestListView);
              },
              child: const Text("Accept Request"),
              color: AppColors.darkSecondaryBackground,
              textColor: Colors.white,
            ),
          )),
      viewModelBuilder: () => AcceptReqViewModel(),
    );
  }
}
