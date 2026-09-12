import 'package:fruit_hub_app/features/auth/data/datasources/auth_remote.dart';
import 'package:fruit_hub_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_facebook.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //service
  getIt.registerSingleton<AuthRemote>(FirebaseAuthService());
  //repository
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemote: getIt<AuthRemote>()),
  );
  //Usecase
  getIt.registerSingleton<SignUpUsecase>(
    SignUpUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<LoginUsecase>(
    LoginUsecase(authRepository: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<SignWithGoogleUsecase>(
    SignWithGoogleUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<SignWithFacebook>(
    SignWithFacebook(authRepo: getIt<AuthRepo>()),
  );
}
