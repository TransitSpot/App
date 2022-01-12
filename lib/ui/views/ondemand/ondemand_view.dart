import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/ondemand/ondemand_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';

@FormView(fields: [
  FormTextField(name: "target", isPassword: false),
])
class OnDemandView extends StatelessWidget {
  const OnDemandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnDemandViewModel>.reactive(
      onModelReady: (viewModel) => {viewModel.updateCameraPosition()},
      onDispose: (model) => model.googleMapController.dispose(),
      builder: (context, model, child) => Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          initialCameraPosition: model.currentCameraPosition,
          onMapCreated: (controller) =>
              model.setGoogleMapController(controller),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await model.updateCameraPosition();
            model.googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(model.currentCameraPosition));
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
