import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/auth/data/datasources/auth_remote.dart';
import 'package:fruit_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemote authRemote;

  AuthRepoImpl({required this.authRemote});
  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final res = await authRemote.signUp(
        email: email,
        password: password,
        name: name,
      );
      await addUser(user: res);
      return right(res);
    } on AppExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemote.login(
        email: email,
        password: password,
      );

      final data = await getUser(uId: res.uId);
      return right(data);
    } on AppExceptions catch (e) {
      print(e.message.toString());

      return left(ServerFailure(message: e.message));
    } catch (e) {
      print(e.toString());

      return left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final res = await authRemote.signInWithGoogle();
      return right(res);
    } on AppExceptions catch (e) {
      print(e.message.toString());

      return left(ServerFailure(message: e.message));
    } catch (e) {
      print(e.toString());
      return left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final res = await authRemote.signInWithFacebook();
      return right(res);
    } on AppExceptions catch (e) {
      print(e.message.toString());

      return left(ServerFailure(message: e.message));
    } catch (e) {
      print(e.toString());
      return left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

  @override
  Future<dynamic> addUser({required UserEntity user}) async {
    UserModel users = UserModel(
      uId: user.uId,
      email: user.email,
      name: user.name,
    );
    await authRemote.addUser(user: users);
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    final res = await authRemote.getUser(uId: uId);
    return res.toEntity();
  }
}
