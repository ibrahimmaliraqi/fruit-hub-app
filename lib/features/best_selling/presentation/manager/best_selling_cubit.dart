import 'package:flutter_bloc/flutter_bloc.dart';

part 'best_selling_state.dart';

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit()
      : super(BestSellingInitial());

  Future<void> getBestSelling() async {
    emit(BestSellingLoading());

    try {
      emit(BestSellingSuccess());
    } catch (e) {
      emit(
        BestSellingFailure(
          message: e.toString(),
        ),
      );
    }
  }
}