import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolproject/providers/login_provider.dart';

class UserRepository {
  LoginProvider _provider = LoginProvider();

  Future<bool> isAuthenticatedFunction() async {
    return await _provider.isSingedIn();
  }

  Future<UserCredential> signInWithCredentialsFunction(
      String email, String password) async {
    return await _provider.signInWithCredentials(email, password);
  }

  Future<UserCredential> signUpFunction(String email, String password) async {
    return await _provider.signUp(email, password);
  }
}
