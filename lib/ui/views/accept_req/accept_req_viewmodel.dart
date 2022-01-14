import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/direction/directions.dart';
import 'package:transitspot/services/directions_service.dart';
import 'package:transitspot/services/driver_state_service.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AcceptReqViewModel extends ReactiveViewModel {
  final _geolocatorService = locator<GeolocatorService>();
  final _placesService = locator<PlacesService>();
  final _directionsService = locator<DirectionsService>();
  final _navigationService = locator<NavigationService>();
  final DriverStateService _driverStateService = locator<DriverStateService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_driverStateService];

  Map<String, Marker> _markers = <String, Marker>{};
  Map<String, Marker> get markers => _markers;
  Directions? _directionsInfo;
  Directions? get directionsInfo => _directionsInfo;

  Future<void> getDestinationByPlaceId(String placeId) async {
    PlacesDetails details = await _placesService.getPlaceDetails(placeId);
    Marker destinationMarker = Marker(
      markerId: const MarkerId('destination'),
      infoWindow: const InfoWindow(title: 'destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(
        details.lat!,
        details.lng!,
      ),
    );
    _markers['destination'] = destinationMarker;

    _directionsInfo = await _directionsService.getDirections(
      destination: destinationMarker.position,
      origin: _markers['initial']!.position,
    );

    notifyListeners();
  }

  void getCurrentPositionAsMarker() {
    Marker initialMarker = Marker(
        markerId: const MarkerId('initial'),
        infoWindow: const InfoWindow(title: 'initial'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
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

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }
}
