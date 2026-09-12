import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';

class SignWithGoogleUsecase {
  final AuthRepo authRepo;

  SignWithGoogleUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call() {
    return authRepo.signInWithGoogle();
  }
}
