import 'package:dartz/dartz.dart';
import 'package:slash/core/errors/failure.dart';
import 'package:slash/features/Home/data/models/product_modal/product_modal.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModal>>> fetchAllProducts();
  Future<Either<Failure, ProductModal>> fetchProductDetails({required int id});
}
