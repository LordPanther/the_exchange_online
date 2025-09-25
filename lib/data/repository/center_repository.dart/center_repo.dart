import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class CenterRepository {
  Future<List<ShopModel>?> fetchCenterStores();

  Future<List<BannerModel>?> fetchCenterBanners();

  Future<List<CategoryModel>?> fetchCenterCategories();

  Future<List<ProductModel>?> fetchCenterPopularProducts();
}
