import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slash/features/Home/data/models/product_details_modal/product_details_modal.dart';
import 'package:slash/features/Home/data/repos/Home_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.homeRepo) : super(ProductDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchProdDetails(int id) async {
    emit(ProductDetailsLoading());
    var result = await homeRepo.fetchProductDetails(id: id);
    result.fold((f) {
      emit(ProductDetailsFailure(errMessage: f.errMessage));
    }, (p) {
      emit(ProductDetailsSuccess(product: p));
    });
  }
}
