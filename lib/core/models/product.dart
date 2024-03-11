import 'package:slash/core/models/Product_Property.dart';
import 'package:slash/core/models/Product_variation.dart';
import 'package:slash/core/models/brand.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final Brand brand;
  final String? brandName;
  final String? brandLogoURL;
  final List<ProductVariation> variations;
  final List<ProductProperty> availableProperries;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    required this.brand,
    required this.brandName,
    required this.brandLogoURL,
    required this.variations,
    required this.availableProperries,
  });
}

