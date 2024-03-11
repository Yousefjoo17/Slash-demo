
import 'package:slash/core/models/pro/Product_Property.dart';
import 'package:slash/core/models/product_modal/product_variation.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String? brandLogoURL;
  final List<ProductVariation>? variations;
  final List<ProductProperty>? availableProperries;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandLogoURL,
    this.variations,
    this.availableProperries,
  });
}
