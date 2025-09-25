import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/product_model.dart';

class CartItemModel extends Equatable {
  final String id;
  final String? productId;
  final int? quantity;
  final double? price;
  final ProductModel? productInfo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? cartItemModelProductInfoId;

  const CartItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    this.productInfo,
    this.createdAt,
    this.updatedAt,
    this.cartItemModelProductInfoId,
  });

  CartItemModel cloneWith({
    productId,
    quantity,
    price,
    productInfo,
    cartItemModelProductInfoId,
  }) {
    return CartItemModel(
      id: id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      productInfo: productInfo ?? this.productInfo,
      cartItemModelProductInfoId:
          cartItemModelProductInfoId ?? this.cartItemModelProductInfoId,
    );
  }

  static CartItemModel fromMap(Map<String, dynamic> data) {
    return CartItemModel(
      id: data["id"],
      productId: data["productId"],
      quantity: data["quantity"],
      price: data["price"],
      productInfo: data["productInfo"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
      cartItemModelProductInfoId: data["cartItemModelProductInfoId"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'productInfo': productInfo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'cartItemModelProductInfoId': cartItemModelProductInfoId
    };
  }

  @override
  String toString() {
    return "CartItemModel:{productId: $productId, quantity: $quantity, price: $price, productInfo: $productInfo, createdAt: $createdAt, updatedAt: $updatedAt, cartItemModelProductInfoId: $cartItemModelProductInfoId,}";
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        quantity,
        price,
        productInfo,
        createdAt,
        updatedAt,
        cartItemModelProductInfoId,
      ];
}
