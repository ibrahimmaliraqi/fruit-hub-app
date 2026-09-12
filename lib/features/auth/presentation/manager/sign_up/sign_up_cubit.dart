import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUsecase;
  SignUpCubit({required this.signUpUsecase}) : super(SignUpInitial());
  Future signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());
    final result = await signUpUsecase.call(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
