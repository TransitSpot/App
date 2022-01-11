import 'package:firebase_auth/firebase_auth.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/datamodels/user/user.dart' as UserApp;
import 'package:transitspot/services/user_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _userService = locator<UserService>();

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
    required bool isDriver,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = UserApp.User(
        email: email,
        name: fullName,
        photoUrl: "https://avatars.dicebear.com/api/personas/$fullName.svg",
        isDriver: isDriver,
      );

      await _userService.addUser(user);

      return authResult.user != null;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser == null ? false : true;
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
