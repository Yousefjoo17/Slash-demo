import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slash/core/errors/failure.dart';
import 'package:slash/core/models/product_modal/product_modal.dart';
import 'package:slash/core/utils/api_service.dart';
import 'package:slash/features/products/data/repos/allProducts_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModal>>> fetchAllProducts() async {
    try {
      var data = await apiService.get() as List;
      List<ProductModal> products = [];
      for (var item in data) {
        // books.add(BookModel.fromJson(item));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioexception(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModal>> fetchProductDetails(
      {required int id}) async {
    try {
      var data = await apiService.get(id: id);

      List<ProductModal> products = [];

      for (var item in data["items"]) {
        // products.add(BookModel.fromJson(item));
      }

      return right(products[0]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioexception(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
