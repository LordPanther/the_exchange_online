import 'package:the_exchange_online/data/models/cart_item_model.dart';
import 'package:the_exchange_online/data/repository/cart_repository/cart_repo.dart';

/// cart is collection in each user
class FirebaseCartRepository implements CartRepository {
  /// Get all cart items

  @override
  Stream<List<CartItemModel>?> fetchCart(String uid) async* {
    yield null;
  }

  /// Add item to cart

  @override
  Future<void> addCartItemModel(String uid, CartItemModel newItem) async {}

  /// Remove item

  @override
  Future<void> removeCartItemModel(String uid, CartItemModel cartItem) async {}

  /// Clear cart

  @override
  Future<void> clearCart(String uid) async {}

  /// Update quantity of cart item

  @override
  Future<void> updateCartItemModel(String uid, CartItemModel cartItem) async {}

  ///Singleton factory
  static final FirebaseCartRepository _instance =
      FirebaseCartRepository._internal();

  factory FirebaseCartRepository() {
    return _instance;
  }

  FirebaseCartRepository._internal();
}
