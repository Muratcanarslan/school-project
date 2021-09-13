import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredentials(
      String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSingedIn() async {
    User? currentUser = _firebaseAuth.currentUser;
    print("user $currentUser");
    return currentUser != null;
  }

  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
