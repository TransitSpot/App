import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/user/user.dart';
import 'package:transitspot/services/firestore_service.dart';

class UserService {
  final _userCollectionRef =
      locator<FirestoreService>().usersCollectionReference;

  void createUser(User user) async {
    await _userCollectionRef.add(user);
  }

  Future<User> getUserById(String id) async {
    return await _userCollectionRef.doc(id).get().then((user) => user.data()!);
  }

  Future<bool> checkIfUserADriverById(String id) async {
    User user = await getUserById(id);
    return user.isDriver;
  }

  Future<void> addUser(String id, User user) async {
    await _userCollectionRef.doc(id).set(user);
  }
}
