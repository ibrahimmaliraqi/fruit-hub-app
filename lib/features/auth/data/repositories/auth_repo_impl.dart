import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/auth/data/datasources/auth_remote.dart';
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
      return right(res);
    } on AppExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }
}
