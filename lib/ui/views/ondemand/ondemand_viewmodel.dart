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
    if (targetValue != null) {
      final placesResult = await _placesService.getAutoComplete(targetValue!);
      if (placesResult != null) {
        _autocompleteResult = placesResult;
        notifyListeners();
      }
    }
  }

  late GoogleMapController _googleMapController;
  GoogleMapController get googleMapController => _googleMapController;

  LatLng _currentLatLng = const LatLng(
    -6.186477,
    106.8296487,
  );
  LatLng get currentLatLng => _currentLatLng;

  CameraPosition _currentCameraPosition = const CameraPosition(
    target: LatLng(
      -6.186477,
      106.8296487,
    ),
    zoom: 11.5,
  );

  CameraPosition get currentCameraPosition => _currentCameraPosition;

  Future<void> updateLatLng() async {
    Position currentPos = await _geolocatorService.getCurrentLocation();
    _currentLatLng = LatLng(currentPos.latitude, currentPos.longitude);
    notifyListeners();
  }

  Future<CameraPosition> getCameraPosition() async {
    await updateLatLng();
    return CameraPosition(target: currentLatLng, zoom: 11.5);
  }

  Future<void> updateCameraPosition() async {
    _currentCameraPosition = await getCameraPosition();
    notifyListeners();
  }

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  void setFormStatus() {
    getAutoCompleteResult();
  }
}
