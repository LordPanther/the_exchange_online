import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object?> get props => [];
}

/// When open cart screen -> load cart event
class LoadShop extends ShopEvent {}

class NoShopFound extends ShopEvent {}

class ShopLoadFailure extends ShopEvent {
  final String error;

  const ShopLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

/// Store was updated
class ShopUpdated extends ShopEvent {
  final ShopModel? shop;

  const ShopUpdated(this.shop);

  @override
  List<Object> get props => [shop!];
}

class CreateShop extends ShopEvent {
  final ShopModel shop;

  const CreateShop(this.shop);

  @override
  List<Object> get props => [shop];
}

/// When user swipes to remove cart item => remove cart item event
class DeleteShop extends ShopEvent {
  final ShopModel shop;

  const DeleteShop(this.shop);

  @override
  List<Object> get props => [shop];
}

/// When user clicks button to add new product => add product item event
class AddProduct extends ShopEvent {
  final ProductModel product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

/// When user clicks button to update product => update product item event
class UpdateProduct extends ShopEvent {
  final ProductModel updatedProduct;

  const UpdateProduct(this.updatedProduct);

  @override
  List<Object> get props => [updatedProduct];
}

/// When user swipes to remove product item => remove product item event
class DeleteProduct extends ShopEvent {
  final ProductModel product;

  const DeleteProduct(this.product);

  @override
  List<Object> get props => [product];
}

/// When user clicks to change quantity => update cart event
class UpdateShop extends ShopEvent {
  final ShopModel shop;

  const UpdateShop(this.shop);

  @override
  List<Object> get props => [shop];
}
