import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // تسجيل الدخول باستخدام Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }

  // تسجيل الدخول باستخدام Facebook
  Future<User?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }

  // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User logged in: ${userCredential.user?.email}");
      // يمكنك هنا تحويل المستخدم إلى الصفحة الرئيسية
    } catch (e) {
      print("Login failed: $e");
      // هنا يمكن إضافة رسالة خطأ للمستخدم
    }
  }
}
