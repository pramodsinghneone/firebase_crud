import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // SIGNUP Method

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'registered';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN IN Method
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'loggedIn';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN OUT Method
  Future signOut() async {
    await _auth.signOut();
    print('signOut');
  }

  Future<GoogleSignInAccount?> handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? accountDetails = await googleSignIn.signIn();
      print(accountDetails!.displayName);
      print(accountDetails.email);
      return accountDetails;
    } catch (error) {
      print(error);
    }
  }

  Future<void> googleSignOut() async {
    try {
      await googleSignIn.disconnect();

      print('Sign out');
    } catch (error) {
      print(error);
    }
  }

  Future<bool> googleLoggedIn() async {
    try {
      bool loggedIn = await googleSignIn.isSignedIn();
      return loggedIn;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
