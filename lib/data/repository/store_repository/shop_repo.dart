import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class ShopRepository {
  Future<List<ShopModel>?> fetchProducts();

  Stream<ShopModel?> fetchShop(String uid);
}
