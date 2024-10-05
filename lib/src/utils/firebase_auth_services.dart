import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static Future signIn(String email, String pass) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }
}
