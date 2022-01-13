import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/livestream/livestream.dart';

import 'firestore_service.dart';

class LivestreamService {
  final _livestreamService =
      locator<FirestoreService>().livestreamCollectionReference;

  Future<String> createLivestream(Livestream newLivestream) async {
    DocumentReference<Livestream> addedLivestream =
        await _livestreamService.add(newLivestream);
    final livestreamId = addedLivestream.id;
    return livestreamId;
  }

  Stream<QuerySnapshot<Livestream>> getStream() {
    return _livestreamService.snapshots();
  }

  Stream<DocumentSnapshot<Livestream>> getDocStream(String id) {
    return _livestreamService.doc(id).snapshots();
  }

  Future<void> updateDriverLatLng(
    LatLng driverLatLng,
    String livestreamId,
  ) async {
    await _livestreamService.doc(livestreamId).update(
      {
        "driverLatitude": driverLatLng.latitude,
        "driverLongitude": driverLatLng.longitude,
      },
    );
  }

  Future<void> updateCustomerLatLng(
    LatLng customerLatLng,
    String livestreamId,
  ) async {
    await _livestreamService.doc(livestreamId).update(
      {
        "customerLatitude": customerLatLng.latitude,
        "customerLongitude": customerLatLng.longitude,
      },
    );
  }

  Future<void> deleteLivestream(String livestreamId) async {
    await _livestreamService.doc(livestreamId).delete();
  }
}
