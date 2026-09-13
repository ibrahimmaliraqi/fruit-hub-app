import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub_app/core/constant/backend_endpoints.dart';
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
  Future<UserModel> signInWithFacebook();
  Future addUser({required UserModel user});
  Future<UserModel> getUser({required String uId});
}

class FirebaseAuthService implements AuthRemote {
  final db = FirebaseFirestore.instance.collection(BackendEndPoints.dbUser);
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

  @override
  Future<UserModel> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status != LoginStatus.success) {
      if (loginResult.status == LoginStatus.cancelled) {
        throw ServerException(
          message: 'تم إلغاء تسجيل الدخول باستخدام Facebook',
        );
      }

      throw ServerException(
        message: loginResult.message ?? 'فشل تسجيل الدخول باستخدام Facebook',
      );
    }

    final accessToken = loginResult.accessToken;

    if (accessToken == null) {
      throw ServerException(
        message: 'تعذر الحصول على رمز الدخول من Facebook',
      );
    }

    final OAuthCredential facebookCredential = FacebookAuthProvider.credential(
      accessToken.tokenString,
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(
          facebookCredential,
        );

    final user = userCredential.user;

    if (user == null) {
      throw ServerException(
        message: 'فشل تسجيل الدخول باستخدام Facebook',
      );
    }

    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }

  @override
  Future<dynamic> addUser({required UserModel user}) async {
    try {
      await db.doc(user.uId).set(user.toMap());
    } catch (e) {
      throw ServerException(message: "فشل اضافة البيانات: $e");
    }
  }

  @override
  Future<UserModel> getUser({required String uId}) async {
    try {
      final res = await db.doc(uId).get();
      return UserModel.fromMap(res.data() as Map<String, dynamic>);
    } catch (e) {
      throw ServerException(message: "فشل استرجاع البيانات: $e");
    }
  }
}
