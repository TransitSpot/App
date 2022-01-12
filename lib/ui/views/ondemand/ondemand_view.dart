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
                listenToFormUpdated(model);
              },
              markers: {
                if (model.markers['initial'] != null) model.markers['initial']!,
                if (model.markers['destination'] != null)
                  model.markers['destination']!,
              },
            ),
            Positioned(
              top: 40,
              child: Material(
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
                              targetController.clear();
                            },
                            title: Text(autoCompleteResult.mainText ?? " "),
                            subtitle:
                                Text(autoCompleteResult.secondaryText ?? " "),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            model.updateCameraPositionToCurrentPos();
          },
          backgroundColor: AppColors.primaryBackground,
          child: const Icon(
            Icons.center_focus_strong,
            color: Colors.black,
          ),
        ),
      ),
      viewModelBuilder: () => OnDemandViewModel(),
    );
  }
}
