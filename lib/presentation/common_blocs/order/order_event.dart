import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/order_model.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadMyOrders extends OrderEvent {}

class AddOrder extends OrderEvent {
  final OrderModel newOrderModel;

  const AddOrder(this.newOrderModel);

  @override
  List<Object> get props => [newOrderModel];
}

class RemoveOrder extends OrderEvent {
  final OrderModel order;

  const RemoveOrder(this.order);

  @override
  List<Object> get props => [order];
}
