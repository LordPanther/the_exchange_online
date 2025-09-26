import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class CreateShopState extends Equatable {
  const CreateShopState();

  @override
  List<Object> get props => [];
}

/// Store loading
class CreatingShop extends CreateShopState {}

/// Store was loaded
class ShopCreated extends CreateShopState {
  final ShopModel? shop;

  const ShopCreated({
    required this.shop,
  });

  @override
  List<Object> get props => [shop!];
}

/// Store wasn't loaded
class ShopCreateError extends CreateShopState {
  final String error;

  const ShopCreateError(this.error);

  @override
  List<Object> get props => [error];
}