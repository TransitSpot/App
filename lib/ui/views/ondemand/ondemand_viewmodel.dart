import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'ondemand_view.form.dart';

class OnDemandViewModel extends FormViewModel {
  final _geolocatorService = locator<GeolocatorService>();
  final _placesService = locator<PlacesService>();

  List<PlacesAutoCompleteResult> _autocompleteResult = [];
  List<PlacesAutoCompleteResult> get autocompleteResult => _autocompleteResult;
  bool get hasAutoCompleteResult => _autocompleteResult.isNotEmpty;
  Future<void> getAutoCompleteResult() async {
    if (targetValue != null || targetValue != "") {
      try {
        final placesResult = await _placesService.getAutoComplete(targetValue!);
        if (placesResult != null) {
          _autocompleteResult = placesResult;
          notifyListeners();
        }
      } catch (_) {
        _autocompleteResult = [];
        notifyListeners();
      }
    }
  }

  Map<String, Marker> _markers = <String, Marker>{};
  Map<String, Marker> get markers => _markers;

  Future<void> getDestinationByPlaceId(String placeId) async {
    PlacesDetails details = await _placesService.getPlaceDetails(placeId);
    Marker destinationMarker = Marker(
      markerId: const MarkerId('destination'),
      infoWindow: const InfoWindow(title: 'destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(
        details.lat!,
        details.lng!,
      ),
    );
    _markers['destination'] = destinationMarker;
    notifyListeners();
  }

  void getCurrentPositionAsMarker() {
    Marker initialMarker = Marker(
        markerId: const MarkerId('initial'),
        infoWindow: const InfoWindow(title: 'initial'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: currentLatLng);
    _markers['initial'] = initialMarker;
    notifyListeners();
  }

  late GoogleMapController _googleMapController;
  GoogleMapController get googleMapController => _googleMapController;

  LatLng _currentLatLng = const LatLng(
    -6.186477,
    106.8296487,
  );
  LatLng get currentLatLng => _currentLatLng;

  Future<void> updateLatLng() async {
    Position currentPos = await _geolocatorService.getCurrentLocation();
    _currentLatLng = LatLng(currentPos.latitude, currentPos.longitude);
    notifyListeners();
  }

  CameraPosition getCameraPosition(LatLng latlng) {
    return CameraPosition(target: latlng, zoom: 11.5);
  }

  void updateCameraPosition(CameraPosition camPosition) {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(camPosition),
    );
    notifyListeners();
  }

  Future<void> updateCameraPositionToCurrentPos() async {
    await updateLatLng();
    getCurrentPositionAsMarker();
    updateCameraPosition(
      getCameraPosition(currentLatLng),
    );
  }

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  void setFormStatus() {
    getAutoCompleteResult();
  }
}
