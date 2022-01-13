import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/ondemand/ondemand_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'ondemand_view.form.dart';

@FormView(fields: [
  FormTextField(name: "target", isPassword: false),
])
class OnDemandView extends StatelessWidget with $OnDemandView {
  OnDemandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnDemandViewModel>.reactive(
      onDispose: (model) {
        model.googleMapController.dispose();
      },
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
                  listenToFormUpdated(model);
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
                          .map((e) => LatLng(e.latitude, e.longitude))
                          .toList(),
                    ),
                },
              ),
              Positioned(
                top: 40,
                child: Column(
                  children: [
                    Material(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: AppColors.primaryBackground,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter your target destination",
                              ),
                              controller: targetController,
                              focusNode: targetFocusNode,
                            ),
                            if (!model.hasAutoCompleteResult)
                              const Text("No suggestion available"),
                            if (model.hasAutoCompleteResult)
                              ...model.autocompleteResult.map(
                                (autoCompleteResult) => ListTile(
                                  onTap: () async {
                                    await model.getDestinationByPlaceId(
                                        autoCompleteResult.placeId!);
                                    model.googleMapController.animateCamera(
                                      CameraUpdate.newLatLngBounds(
                                          model.directionsInfo!.bounds, 100),
                                    );
                                    targetController.clear();
                                  },
                                  title:
                                      Text(autoCompleteResult.mainText ?? " "),
                                  subtitle: Text(
                                      autoCompleteResult.secondaryText ?? " "),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (model.directionsInfo != null &&
                        !model.hasAutoCompleteResult)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: Text(
                            '${model.directionsInfo!.totalDistance}, ${model.directionsInfo!.totalDuration}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
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
              onPressed: () async {
                showRequestAlert(context, model.timerCountdown);
                await model.sendRequest();
              },
              child: const Text("Request"),
              color: AppColors.secondaryBackground,
              textColor: Colors.white,
            ),
          )),
      viewModelBuilder: () => OnDemandViewModel(),
    );
  }

  Future<dynamic> showRequestAlert(BuildContext context, int time) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Requesting for driver'),
        content: Text('Waiting for $time second'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
