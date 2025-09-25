import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/cart_item_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

/// Cart loading
class CartLoading extends CartState {}

/// Cart was loaded
class CartLoaded extends CartState {
  final List<CartItemModel> cart;
  final int priceOfGoods;

  const CartLoaded({
    required this.cart,
    required this.priceOfGoods,
  });

  @override
  List<Object> get props => [cart, priceOfGoods];
}

/// Cart wasn't loaded
class CartLoadFailure extends CartState {
  final String error;

  const CartLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
