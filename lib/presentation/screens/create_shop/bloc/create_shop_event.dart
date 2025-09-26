import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class CreateShopEvent extends Equatable {
  const CreateShopEvent();

  @override
  List<Object?> get props => [];
}

/// When user clicks to add button => add cart item event
class CreateShop extends CreateShopEvent {
  final ShopModel shop;

  const CreateShop(this.shop);

  @override
  List<Object> get props => [shop];
}