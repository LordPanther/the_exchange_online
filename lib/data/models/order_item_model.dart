import 'package:equatable/equatable.dart';

class OrderModelItem extends Equatable {
  final String id;
  final String? productName;
  final double? productPrice;
  final String? productImage;
  final int? quantity;
  final String? ordermodelID;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const OrderModelItem(
      {required this.id,
      this.productName,
      this.productPrice,
      this.productImage,
      this.quantity,
      required this.ordermodelID,
      this.createdAt,
      this.updatedAt});

  OrderModelItem cloneWith(
      {String? productName,
      double? productPrice,
      String? productImage,
      int? quantity,
      String? ordermodelID}) {
    return OrderModelItem(
        id: id,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productImage: productImage ?? this.productImage,
        quantity: quantity ?? this.quantity,
        ordermodelID: ordermodelID ?? this.ordermodelID);
  }

  static OrderModelItem fromMap(Map<String, dynamic> data) {
    return OrderModelItem(
      id: data["id"],
      productName: data["productName"],
      productPrice: data["productPrice"],
      productImage: data["productImage"],
      quantity: data["quantity"],
      ordermodelID: data["ordermodelID"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
      'quantity': quantity,
      'ordermodelID': ordermodelID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "OrderModelItemModelIdentifier:{id: $id, productName: $productName, productPrice: $productPrice, productImage: $productImage, quantity: $quantity, ordermodelID: $ordermodelID, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        productPrice,
        productImage,
        quantity,
        ordermodelID,
      ];
}
