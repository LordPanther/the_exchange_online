import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

/// Store loading
class ShopLoading extends ShopState {}

/// Store was loaded
class ShopLoaded extends ShopState {
  final ShopModel? shop;

  const ShopLoaded({
    required this.shop,
  });

  @override
  List<Object> get props => [shop!];
}

/// Store wasn't loaded
class ShopLoadError extends ShopState {
  final String error;

  const ShopLoadError(this.error);

  @override
  List<Object> get props => [error];
}

// Shop not found
class ShopNotFound extends ShopState {}

/// Adding or Updating product
class ProductUpdating extends ShopState {}

/// Product added or updated
class ProductUpdated extends ShopState {}

/// Product processing failure
class ProductUpdateFailure extends ShopState {
  final String error;

  const ProductUpdateFailure(this.error);

  @override
  List<Object> get props => [error];
}
