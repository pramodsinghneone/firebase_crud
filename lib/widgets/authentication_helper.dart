import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
