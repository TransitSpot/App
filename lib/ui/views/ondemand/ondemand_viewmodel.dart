import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/direction/directions.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/services/directions_service.dart';
import 'package:transitspot/services/geolocator_service.dart';
import 'package:transitspot/services/request_service.dart';
import 'package:transitspot/services/authentication_service.dart';
import 'package:transitspot/services/user_service.dart';
import 'ondemand_view.form.dart';

class OnDemandViewModel extends FormViewModel {
  final _geolocatorService = locator<GeolocatorService>();
  final _placesService = locator<PlacesService>();
  final _directionsService = locator<DirectionsService>();
  final _requestService = locator<RequestService>();
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

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

  void getDriverPositionAsMarker() {
    Marker driverMarker = Marker(
        markerId: const MarkerId('driver'),
        infoWindow: const InfoWindow(title: 'driver'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: driverLatLng!);
    _markers['driver'] = driverMarker;
    notifyListeners();
  }

  late GoogleMapController _googleMapController;
  GoogleMapController get googleMapController => _googleMapController;

  LatLng _currentLatLng = const LatLng(
    -6.186477,
    106.8296487,
  );
  LatLng get currentLatLng => _currentLatLng;
  LatLng? _driverLatLng;
  LatLng? get driverLatLng => _driverLatLng;

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

  int _timerCountdown = 10;
  int get timerCountdown => _timerCountdown;
  Future<void> sendRequest() async {
    final authData = _authService.getCurrentUser();
    final user = await _userService.getUserById(authData!.uid);
    if (markers['destination'] != null) {
      Request newRequest = Request(
        customerName: user.name,
        customerLatitude: _currentLatLng.latitude,
        customerLongitude: _currentLatLng.longitude,
        destinationLatitude: markers['destination']!.position.latitude,
        destinationLongitude: markers['destination']!.position.longitude,
        isExpired: false,
        isAccepted: false,
      );
      String requestId = await _requestService.createRequest(newRequest);
      bool isAccepted = false;

      _requestService.getDocStream(requestId).listen(
        (event) {
          final data = event.data();
          if (data != null) {
            if (data.isAccepted) {
              isAccepted = true;
            }
          }
        },
      );

      while (true) {
        await Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            _timerCountdown = _timerCountdown - 1;
            notifyListeners();
          },
        );

        if (isAccepted) {
          _isRequestAccepted = true;
          _requestService.getDriverLiveStream(requestId).listen((event) async {
            final data = event.data()!;
            _driverLatLng = LatLng(data.latitude, data.longitude);
            notifyListeners();
            getDriverPositionAsMarker();
            updateCameraPosition(getCameraPosition(_driverLatLng!));

            _directionsInfo = await _directionsService.getDirections(
              destination: markers['driver']!.position,
              origin: _markers['initial']!.position,
            );
            notifyListeners();
          });
          notifyListeners();
          break;
        }
        if (timerCountdown == 0) {
          await _requestService.deleteRequest(requestId);
          break;
        }
      }

      _timerCountdown = 10;
    }
  }

  bool _isRequestAccepted = false;
  bool get isRequestAccepted => _isRequestAccepted;

  @override
  void setFormStatus() {
    getAutoCompleteResult();
  }
}
