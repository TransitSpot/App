import 'package:firebase_auth/firebase_auth.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/datamodels/user/user.dart' as UserApp;
import 'package:transitspot/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _navigationService = locator<NavigationService>();
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
      rethrow;
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

      var nameToUri = Uri.encodeComponent(fullName);
      var user = UserApp.User(
        email: email,
        name: fullName,
        photoUrl: "https://avatars.dicebear.com/api/personas/$nameToUri.png",
        isDriver: isDriver,
      );

      await _userService.addUser(authResult.user!.uid, user);

      return authResult.user != null;
    } catch (e) {
      rethrow;
    }
  }

  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser == null ? false : true;
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _navigationService.navigateTo(Routes.registerView);
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
