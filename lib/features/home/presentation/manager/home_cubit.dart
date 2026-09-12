import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeInitial());

  Future<void> getHome() async {
    emit(HomeLoading());

    try {
      emit(HomeSuccess());
    } catch (e) {
      emit(
        HomeFailure(
          message: e.toString(),
        ),
      );
    }
  }
}