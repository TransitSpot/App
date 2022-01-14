import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/direction/directions.dart';
import 'package:transitspot/datamodels/location_lat_lng/location_lat_lng.dart';
import 'package:transitspot/services/directions_service.dart';
import 'package:transitspot/services/driver_state_service.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transitspot/services/request_service.dart';
import 'package:transitspot/app/app.router.dart';

Future<List<Request>> request() async {
  const data = [
    Request(
      customerName: 'John Doe',
      customerLatitude: 1.29,
      customerLongitude: 103.8,
      destinationLatitude: 1.29,
      destinationLongitude: 103.8,
      isExpired: false,
      isAccepted: false,
    ),
    Request(
      customerName: 'Nana Doe',
      customerLatitude: 1.29,
      customerLongitude: 103.8,
      destinationLatitude: 1.29,
      destinationLongitude: 103.8,
      isExpired: false,
      isAccepted: false,
    ),
    Request(
      customerName: 'John lele',
      customerLatitude: 1.29,
      customerLongitude: 103.8,
      destinationLatitude: 1.29,
      destinationLongitude: 103.8,
      isExpired: false,
      isAccepted: false,
    ),
    Request(
      customerName: 'Dodo mama',
      customerLatitude: 1.29,
      customerLongitude: 103.8,
      destinationLatitude: 1.29,
      destinationLongitude: 103.8,
      isExpired: false,
      isAccepted: false,
    ),
    Request(
      customerName: 'HUHU nama',
      customerLatitude: 1.29,
      customerLongitude: 103.8,
      destinationLatitude: 1.29,
      destinationLongitude: 103.8,
      isExpired: false,
      isAccepted: false,
    ),
  ];

  return data;
}

class RequestListViewModel extends ReactiveViewModel {
  final _geolocatorService = locator<GeolocatorService>();
  final _placesService = locator<PlacesService>();
  final _directionsService = locator<DirectionsService>();
  final _navigationService = locator<NavigationService>();
  final Stream<QuerySnapshot<Request>> _requestStream =
      locator<RequestService>().getStream();
  final _requestService = locator<RequestService>();
  final DriverStateService _driverStateService = locator<DriverStateService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_driverStateService];

  Stream<QuerySnapshot<Request>> get requestStream => _requestStream;

  Future<List<Request>>? searchRes;

  Future getData() async {
    setBusy(true);
    searchRes = request();
    setBusy(false);
  }

  Future navigatePage(String page) async {
    await _navigationService.navigateTo(page);
  }

  Future seeRequest(Request request, String requestId) async {
    await _navigationService.navigateTo(
      Routes.receiveReqView,
      arguments:
          ReceiveReqViewArguments(request: request, requestId: requestId),
    );
  }

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
    -6.895,
    107.602,
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

  bool get isRequestAcceptedAvailable =>
      _driverStateService.acceptedRequestsId.length != 0;

  Future<void> broadcastPosition() async {
    while (true) {
      await Future.delayed(
        const Duration(milliseconds: 2000),
        () async {
          for (String requestId in _driverStateService.acceptedRequestsId) {
            await updateLatLng();
            await _requestService.updateDriverLatLng(
              requestId,
              _currentLatLng,
            );
          }
          notifyListeners();
        },
      );
    }
  }

  void setGoogleMapController(GoogleMapController controller) {
    _googleMapController = controller;
  }
}
