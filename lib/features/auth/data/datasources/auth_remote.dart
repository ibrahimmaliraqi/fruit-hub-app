import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';
import 'package:fruit_hub_app/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemote {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<UserModel> login({
    required String email,
    required String password,
  });
  Future<UserModel> signInWithGoogle();
}

class FirebaseAuthService implements AuthRemote {
  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      return UserModel(
        uId: credential.user!.uid,
        email: credential.user!.email ?? '',
        name: name,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerException(
          message: 'The account already exists for that email.',
        );
      } else {
        print(e.code);
        throw ServerException(message: 'An error occurred during sign up.');
      }
    } catch (e) {
      print(e.toString());

      throw ServerException(message: 'An error occurred during sign up.');
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        uId: credential.user!.uid,
        email: credential.user!.email ?? '',
        name: credential.user!.displayName ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ServerException(
          message: 'Wrong password provided for that user.',
        );
      } else {
        print(e.code);
        throw ServerException(message: 'An error occurred during login.');
      }
    } catch (e) {
      throw ServerException(message: 'An error occurred during login.');
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    if (googleUser == null) {
      throw ServerException(message: 'تم إلغاء تسجيل الدخول باستخدام Google');
    }

    // الحصول على بيانات المصادقة
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // إنشاء Firebase Credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // تسجيل الدخول إلى Firebase
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);

    // تحويل Firebase User إلى UserModel
    final user = userCredential.user;

    if (user == null) {
      throw ServerException(message: 'فشل تسجيل الدخول باستخدام Google');
    }

    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }
}
