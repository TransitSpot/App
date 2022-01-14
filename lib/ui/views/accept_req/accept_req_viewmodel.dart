import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/direction/directions.dart';
import 'package:transitspot/datamodels/location_lat_lng/location_lat_lng.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/services/directions_service.dart';
import 'package:transitspot/services/driver_state_service.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/services/request_service.dart';

class AcceptReqViewModel extends ReactiveViewModel {
  final _geolocatorService = locator<GeolocatorService>();
  final _placesService = locator<PlacesService>();
  final _directionsService = locator<DirectionsService>();
  final _navigationService = locator<NavigationService>();
  final _requestService = locator<RequestService>();
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

  Future<void> acceptRequest(String requestId, Request request) async {
    await _requestService.addDriverLatLng(
      requestId,
      LocationLatLng(
          latitude: _currentLatLng.latitude,
          longitude: _currentLatLng.longitude),
    );
    await _requestService.markRequestAsAccepted(requestId);
    _driverStateService.addAcceptedRequestId(requestId);
    await _navigationService.navigateTo(Routes.requestListView);
  }

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
  }
}
