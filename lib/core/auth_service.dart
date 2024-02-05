import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword({required String email,required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('haai this is my user ${userCredential.user}');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
      return null;
    }
  }

  // Add other authentication methods (e.g., sign up, sign out) as needed

  // Example of sign out method:
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
