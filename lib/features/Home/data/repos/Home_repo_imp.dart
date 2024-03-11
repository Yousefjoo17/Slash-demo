import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slash/core/errors/failure.dart';
import 'package:slash/features/Home/data/models/product_modal/product_modal.dart';
import 'package:slash/core/utils/api_service.dart';
import 'package:slash/features/Home/data/repos/Home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModal>>> fetchAllProducts() async {
    try {
      var data = await apiService.get();
      List<ProductModal> products = [];
      print(data["data"][0]);

      for (var item in data["data"]) {
        products.add(ProductModal.fromJson(item));
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
      var data = await apiService.get(id: id) as List;

      List<ProductModal> products = [];

      for (var item in data) {
        products.add(item.fromJson(item));
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
