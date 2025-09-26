import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'package:the_exchange_online/data/repository/store_repository/shop_repo.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/bloc/create_shop_event.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/bloc/create_shop_state.dart';

class CreateShopBloc extends Bloc<CreateShopEvent, CreateShopState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  final ShopRepository _shopRepository = AppRepository.shopRepository;
  late String _currentShop;

  CreateShopBloc() : super(CreatingShop()) {
    on<CreateShop>((event, emit) async {
      await _mapCreateShopToState(event, emit);
    });
  }

  Future<void> _mapCreateShopToState(
    event,
    Emitter<CreateShopState> emit,
  ) async {
    try {} catch (error) {
      const ShopCreateError("store_create_error");
    }
  }
}
