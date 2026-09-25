import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hub_app/features/home/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:meta/meta.dart';

part 'get_best_selling_products_state.dart';

class GetBestSellingProductsCubit extends Cubit<GetBestSellingProductsState> {
  final GetBestSellingProductsUsecase getBestSellingProductsUsecase;
  GetBestSellingProductsCubit({required this.getBestSellingProductsUsecase})
    : super(GetBestSellingProductsInitial());
  Future getBestSellingProducts() async {
    emit(GetBestSellingProductsLoading());
    final res = await getBestSellingProductsUsecase.call();
    res.fold(
      (l) => emit(GetBestSellingProductsFailure(message: l.message)),
      (r) => emit(GetBestSellingProductsSuccess(products: r)),
    );
  }
}
