import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  final SignWithGoogleUsecase signWithGoogleUsecase;
  LoginCubit({required this.loginUsecase, required this.signWithGoogleUsecase})
    : super(LoginInitial());
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUsecase.call(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await signWithGoogleUsecase.call();
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
