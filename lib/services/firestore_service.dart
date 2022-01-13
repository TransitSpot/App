import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transitspot/datamodels/location_lat_lng/location_lat_lng.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/datamodels/user/user.dart';

class FirestoreService {
  final CollectionReference<User> usersCollectionReference =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  final CollectionReference<Request> requestCollectionReference =
      FirebaseFirestore.instance.collection('request').withConverter<Request>(
            fromFirestore: (snapshot, _) => Request.fromJson(snapshot.data()!),
            toFirestore: (request, _) => request.toJson(),
          );

  CollectionReference<LocationLatLng> getRequestLocationReference(
      String requestId) {
    return FirebaseFirestore.instance
        .collection('request')
        .doc(requestId)
        .collection("location")
        .withConverter<LocationLatLng>(
          fromFirestore: (snapshot, _) =>
              LocationLatLng.fromJson(snapshot.data()!),
          toFirestore: (request, _) => request.toJson(),
        );
  }
}
