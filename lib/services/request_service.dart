import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/location_lat_lng/location_lat_lng.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/services/firestore_service.dart';

class RequestService {
  final _requestService =
      locator<FirestoreService>().requestCollectionReference;

  final _firestoreService = locator<FirestoreService>();

  Future<String> createRequest(Request newRequest) async {
    DocumentReference<Request> addedRequest =
        await _requestService.add(newRequest);
    final requestId = addedRequest.id;
    return requestId;
  }

  Stream<QuerySnapshot<Request>> getStream() {
    return _requestService.snapshots();
  }

  Stream<DocumentSnapshot<Request>> getDocStream(String id) {
    return _requestService.doc(id).snapshots();
  }

  Future<void> markRequestAsExpired(String requestId) async {
    await _requestService.doc(requestId).update({"isExpired": true});
  }

  Future<void> markRequestAsAccepted(String requestId) async {
    await _requestService.doc(requestId).update({"isAccepted": true});
  }

  Future<void> deleteRequest(String requestId) async {
    await _requestService.doc(requestId).delete();
  }

  Future<void> addDriverLatLng(
      String requestId, LocationLatLng driverLatLng) async {
    await _firestoreService
        .getRequestLocationReference(requestId)
        .doc("driver")
        .set(driverLatLng);
  }

  Future<void> updateDriverLatLng(String requestId, LatLng driverLatLng) async {
    await _requestService
        .doc(requestId)
        .collection("location")
        .doc("driver")
        .update(
      {
        "latitude": driverLatLng.latitude,
        "longitude": driverLatLng.longitude,
      },
    );
  }

  Stream<DocumentSnapshot<LocationLatLng>> getDriverLiveStream(
      String requestId) {
    return _firestoreService
        .getRequestLocationReference(requestId)
        .doc("driver")
        .snapshots();
  }
}
