import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo authRepository;

  LoginUsecase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }
}
