import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';

abstract class ProductRepository {
  /// Get all products

  Future<List<ProductModel>> fetchProducts();

  Future<List<ProductModel>> fetchAuctionProducts();

  /// Get popular products

  Future<List<ProductModel>> fetchCenterPopularProducts();

  /// Get discount products

  Future<List<ProductModel>> fetchDiscountProducts();

  /// Get products by category
  /// [categoryId] is id of category

  Future<List<ProductModel>> fetchProductsByCategory(String? categoryId);

  /// Get product by Id
  /// [pid] is product id

  Future<ProductModel> getProductById(String pid);

  /// Update product rating
  /// [pid] is product id
  /// [rating] is updated rating

  Future<void> updateProductRatingById(String pid, double rating);

  /// Get all categories

  Future<List<CategoryModel>> fetchCenterCategories();

  /// Get category by id

  Future<CategoryModel> getCategoryById(String caregoryId);
}
