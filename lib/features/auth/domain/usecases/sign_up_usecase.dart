import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';

class SignUpUsecase {
  final AuthRepo authRepo;

  SignUpUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String name,
  }) async {
    return authRepo.signUp(email: email, password: password, name: name);
  }
}
