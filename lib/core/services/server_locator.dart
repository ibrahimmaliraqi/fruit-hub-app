import 'package:fruit_hub_app/features/auth/data/datasources/auth_remote.dart';
import 'package:fruit_hub_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:fruit_hub_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_facebook.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:fruit_hub_app/features/home/data/datasources/home_remote.dart';
import 'package:fruit_hub_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:fruit_hub_app/features/home/domain/repositories/home_repo.dart';
import 'package:fruit_hub_app/features/home/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:fruit_hub_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //service
  getIt.registerSingleton<AuthRemote>(FirebaseAuthService());
  getIt.registerSingleton<HomeRemote>(FireBaseHomeRemote());
  //repository
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemote: getIt<AuthRemote>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(homeRemote: getIt<HomeRemote>()),
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
  getIt.registerSingleton<GetProductsUsecase>(
    GetProductsUsecase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetBestSellingProductsUsecase>(
    GetBestSellingProductsUsecase(homeRepo: getIt<HomeRepo>()),
  );
}
