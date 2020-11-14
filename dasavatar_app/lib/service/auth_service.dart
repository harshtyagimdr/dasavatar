import 'package:dasavatar_app/utils/global.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();

  factory AuthService.getInstance() => _instance;
  static final AuthService _instance = AuthService._();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> login({String email, String passowrd}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: passowrd);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast(msg: 'Wrong password provided for that user.');
      }
    } catch (e) {
      print("Log In in Auth Service");
      print(e);
      throw e;
    }
  }

  Future<String> signUp({String email, String passowrd}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: passowrd,
      );
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast(msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print("Sign UP in Auth Service");
      print(e);
      throw e;
    }
  }

  logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Log Out in Auth Service");
      print(e);
      return e;
    }
  }
}
