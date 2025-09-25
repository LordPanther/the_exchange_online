import 'package:equatable/equatable.dart';

import 'models.dart';

class OrderModel extends Equatable {
  final String id;
  final String? uid;
  final String? paymentMethod;
  final double? priceToBePaid;
  final double? priceOfGoods;
  final double? deliveryFee;
  final int? coupon;
  final bool? isDelivering;
  final DateTime? createdAt;
  final List<OrderModelItem>? items;
  final DeliveryAddressModel? deliveryAddress;
  final DateTime? updatedAt;
  final String? orderModelDeliveryAddressId;

  const OrderModel({
    required this.id,
    this.uid,
    this.paymentMethod,
    this.priceToBePaid,
    this.priceOfGoods,
    this.deliveryFee,
    this.coupon,
    this.isDelivering,
    this.createdAt,
    this.items,
    this.deliveryAddress,
    this.updatedAt,
    this.orderModelDeliveryAddressId,
  });

  OrderModel cloneWith({
    uid,
    paymentMethod,
    priceToBePaid,
    priceOfGoods,
    deliveryFee,
    coupon,
    isDelivering,
    createdAt,
    items,
    deliveryAddress,
    updatedAt,
    orderModelDeliveryAddressId,
  }) {
    return OrderModel(
      id: id,
      uid: uid ?? this.uid,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      priceToBePaid: priceToBePaid ?? this.priceToBePaid,
      priceOfGoods: priceOfGoods ?? this.priceOfGoods,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      coupon: coupon ?? this.coupon,
      isDelivering: isDelivering ?? this.isDelivering,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      updatedAt: updatedAt ?? this.updatedAt,
      orderModelDeliveryAddressId:
          orderModelDeliveryAddressId ?? this.orderModelDeliveryAddressId,
    );
  }

  static OrderModel fromMap(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'],
      uid: data['uid'],
      paymentMethod: data['paymentMethod'],
      priceToBePaid: data['priceToBePaid'],
      priceOfGoods: data['priceOfGoods'],
      deliveryFee: data['deliveryFee'],
      coupon: data['coupon'],
      isDelivering: data['isDelivering'],
      createdAt: DateTime.parse(data['createdAt']),
      items: data['items'] != null
          ? List<OrderModelItem>.from(
              data['items'].map((i) => OrderModelItem.fromMap(i)))
          : null,
      deliveryAddress: data['deliveryAddress'] != null
          ? DeliveryAddressModel.fromMap(data['deliveryAddress'])
          : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
      orderModelDeliveryAddressId: data['orderModelDeliveryAddressId'],
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'uid': uid,
        'paymentMethod': paymentMethod,
        'priceToBePaid': priceToBePaid,
        'priceOfGoods': priceOfGoods,
        'deliveryFee': deliveryFee,
        'coupon': coupon,
        'isDelivering': isDelivering,
        'createdAt': createdAt,
        'items': items,
        'deliveryAddress': deliveryAddress,
        'updatedAt': updatedAt,
        'orderModelDeliveryAddressId': orderModelDeliveryAddressId,
      };

  @override
  String toString() {
    return "OrderModel:{id: $id, uid: $uid, paymentMethod: $paymentMethod, priceToBePaid: $priceToBePaid, priceOfGoods: $priceOfGoods, deliveryFee: $deliveryFee, coupon: $coupon, isDelivering: $isDelivering ,createdAt: $createdAt, items: $items, deliveryAddress: $deliveryAddress, updatedAt: $updatedAt, orderModelDeliveryAddressId: $orderModelDeliveryAddressId}";
  }

  @override
  List<Object?> get props => [
        id,
        uid,
        paymentMethod,
        priceToBePaid,
        priceOfGoods,
        deliveryFee,
        coupon,
        isDelivering,
        createdAt,
        items,
        deliveryAddress,
        updatedAt,
        orderModelDeliveryAddressId,
      ];
}
