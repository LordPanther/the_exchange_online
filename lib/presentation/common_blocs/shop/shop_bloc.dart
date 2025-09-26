import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'package:the_exchange_online/data/repository/store_repository/shop_repo.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  final ShopRepository _shopRepository = AppRepository.shopRepository;
  late String _currentShop;
  StreamSubscription? _shopSubscription;

  ShopBloc() : super(ShopLoading()) {
    on<LoadShop>((event, emit) async {
      await _mapLoadShopToState(event, emit);
    });
    on<CreateShop>((event, emit) async {
      await _mapCreateShopToState(event, emit);
    });
    on<DeleteShop>((event, emit) async {
      await _mapDeleteShopToState(event, emit);
    });
    on<UpdateShop>((event, emit) async {
      await _mapUpdateStoreToState(event, emit);
    });
    on<ShopUpdated>((event, emit) async {
      await _mapShopUpdatedToState(event, emit);
    });
    on<AddProduct>((event, emit) async {
      await _mapAddProductToState(event, emit);
    });
    on<UpdateProduct>((event, emit) async {
      await _mapUpdateProductToState(event, emit);
    });
    on<DeleteProduct>((event, emit) async {
      await _mapDeleteProductToState(event, emit);
    });
    on<NoShopFound>((event, emit) async {
      await _mapNoShopFoundToState(event, emit);
    });
    on<ShopLoadFailure>((event, emit) async {
      await _mapShopLoadFailureToState(event, emit);
    });
  }

  //Load shop
  Future<void> _mapLoadShopToState(event, Emitter<ShopState> emit) async {
    try {
      await _shopSubscription?.cancel();
      _currentShop = _authRepository.currentUser.uid;
      _shopSubscription = _shopRepository
          .fetchShop(_currentShop)
          .listen(
            (shop) async {
              if (shop != null) {
                add(ShopUpdated(shop));
              } else {
                debugPrint("Shop Not Found");
                add(NoShopFound());
              }
            },
            onError: (error) {
              add(ShopLoadFailure(error.toString()));
            },
          );
    } catch (e) {
      if (!emit.isDone) {
        emit(ShopLoadError(e.toString()));
      }
    }
  }

  //Create shop
  Future<void> _mapCreateShopToState(event, Emitter<ShopState> emit) async {
    try {} catch (error) {
      const ShopCreateError("store_create_error");
    }
  }

  //Delete shop
  Future<void> _mapDeleteShopToState(event, Emitter<ShopState> emit) async {
    try {} catch (error) {
      const ShopLoadFailure("store_delete_error");
    }
  }

  //Update shop
  Future<void> _mapUpdateStoreToState(event, Emitter<ShopState> emit) async {
    try {} catch (e) {
      const ShopLoadFailure("store_update_error");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///Add new product to shop
  Future<void> _mapAddProductToState(event, Emitter<ShopState> emit) async {
    var imageFiles = event.images;
  }

  ///Update product data
  Future<void> _mapUpdateProductToState(event, Emitter<ShopState> emit) async {
    var imageFiles = event.images;
  }

  ///Delete product
  Future<void> _mapDeleteProductToState(event, Emitter<ShopState> emit) async {
    var imageFiles = event.images;
  }

  //Shop updated
  Future<void> _mapShopUpdatedToState(event, Emitter<ShopState> emit) async {
    var shop = event.shop;

    debugPrint("Shop updated: ${shop.toJson()}");
    emit(ShopLoaded(shop: shop));
  }

  //Shop does not exist
  Future<void> _mapNoShopFoundToState(event, Emitter<ShopState> emit) async {
    emit(ShopNotFound());
  }

  //Loading shop failed
  Future<void> _mapShopLoadFailureToState(
    event,
    Emitter<ShopState> emit,
  ) async {
    var error = event.error;

    emit(ShopLoadError(error));
  }

  @override
  Future<void> close() {
    _shopSubscription?.cancel();
    return super.close();
  }
}
