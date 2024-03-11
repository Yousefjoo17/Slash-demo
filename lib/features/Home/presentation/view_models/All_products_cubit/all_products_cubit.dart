import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slash/features/Home/data/models/product_modal/product_modal.dart';
import 'package:slash/features/Home/data/repos/Home_repo.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitial());
  
  final HomeRepo homeRepo;
  Future<void> featchAllProducts() async {
    emit(AllProductsLoading());
    var result = await homeRepo.fetchAllProducts();
    result.fold(
      (booksfailure) {
        emit(AllProductsFailure(errMessage: booksfailure.errMessage));
      },
      (produts) {
        emit(AllProductsSuccess(products: produts));
      },
    );
  }
}
