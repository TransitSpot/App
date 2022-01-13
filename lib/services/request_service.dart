import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/request/request.dart';
import 'package:transitspot/services/firestore_service.dart';

class RequestService {
  final _requestService =
      locator<FirestoreService>().requestCollectionReference;

  Future<String> createRequest(Request newRequest) async {
    DocumentReference<Request> addedRequest =
        await _requestService.add(newRequest);
    final requestId = addedRequest.id;
    return requestId;
  }

  Stream<QuerySnapshot<Request>> getStream() {
    return _requestService.snapshots();
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
}
