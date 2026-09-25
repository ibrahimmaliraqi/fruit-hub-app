import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hub_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final GetProductsUsecase getProductsUsecase;
  GetProductsCubit({required this.getProductsUsecase})
    : super(GetProductsInitial());

  Future getProducts() async {
    emit(GetProductsLoading());
    final res = await getProductsUsecase.call();
    res.fold(
      (l) => emit(GetProductsFailure(l.message)),
      (r) => emit(GetProductsSuccess(r)),
    );
  }
}
