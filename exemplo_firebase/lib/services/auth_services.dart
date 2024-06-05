import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //method login
  Future<User?> loginUsuario(String email, String password) async {
    //try and catch
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register user
  Future<User?> registerUsuario(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout user
  Future<void> logoutUsuario() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
