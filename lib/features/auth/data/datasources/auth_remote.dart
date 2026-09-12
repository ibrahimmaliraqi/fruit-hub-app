import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';
import 'package:fruit_hub_app/features/auth/data/models/user_model.dart';

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
}
