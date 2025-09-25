import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:the_exchange_online/data/repository/cart_repository/cart_repo.dart';
import 'package:the_exchange_online/data/repository/product_repository/product_repo.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/cart_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  final CartRepository _cartRepository = AppRepository.cartRepository;
  final ProductRepository _productRepository = AppRepository.productRepository;
  late String _loggedFirebaseUser;
  StreamSubscription? _fetchCartSub;

  CartBloc() : super(CartLoading()) {
    on<LoadCart>((event, emit) async {
      await _mapLoadCartToState(event, emit);
    });
    on<AddCartItemModel>((event, emit) async {
      await _mapAddCartItemModelToState(event, emit);
    });
    on<RemoveCartItemModel>((event, emit) async {
      await _mapRemoveCartItemModelToState(event, emit);
    });
    on<UpdateCartItemModel>((event, emit) async {
      await _mapUpdateCartItemModelToState(event, emit);
    });
    on<ClearCart>((event, emit) async {
      await _mapClearCartToState(event, emit);
    });
    on<CartUpdated>((event, emit) async {
      await _mapCartUpdatedToState(event, emit);
    });
  }

  Future<void> _mapLoadCartToState(event, Emitter<CartState> emit) async {
    try {
      _fetchCartSub?.cancel();
      _loggedFirebaseUser = _authRepository.userId!;
      _fetchCartSub = _cartRepository
          .fetchCart(_loggedFirebaseUser)
          .listen((cart) => add(CartUpdated(cart!)));
    } catch (e) {
      emit(CartLoadFailure(e.toString()));
    }
  }

  Future<void> _mapAddCartItemModelToState(
      event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.addCartItemModel(
          _loggedFirebaseUser, event.cartItem);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _mapRemoveCartItemModelToState(
      event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.removeCartItemModel(
        _loggedFirebaseUser,
        event.cartItem,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _mapUpdateCartItemModelToState(
      event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.updateCartItemModel(
        _loggedFirebaseUser,
        event.cartItem,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _mapClearCartToState(event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.clearCart(_loggedFirebaseUser);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _mapCartUpdatedToState(event, Emitter<CartState> emit) async {
    emit(CartLoading());

    var updatedCart = event.updatedCart;
    var priceOfGoods = 0;
    for (var i = 0; i < updatedCart.length; i++) {
      priceOfGoods += updatedCart[i].price as int;
      // Get product by id that is provided from cart item
      try {
        var productInfo =
            await _productRepository.getProductById(updatedCart[i].productId);
        updatedCart[i] = updatedCart[i].cloneWith(productInfo: productInfo);
      } catch (e) {
        emit(CartLoadFailure(e.toString()));
      }
    }

    emit(CartLoaded(
      cart: updatedCart,
      priceOfGoods: priceOfGoods,
    ));
  }

  @override
  Future<void> close() {
    _fetchCartSub?.cancel();
    return super.close();
  }
}
