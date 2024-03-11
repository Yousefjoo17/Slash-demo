import 'package:slash/core/models/product_varient_image.dart';

class ProductVariation {
  int id;
  int productID;
  double price;
  int quantity;
  List<ProductVarientImage> productVarientImage;

  ProductVariation({
    required this.id,
    required this.productID,
    required this.price,
    required this.quantity,
    required this.productVarientImage,
  });
}
