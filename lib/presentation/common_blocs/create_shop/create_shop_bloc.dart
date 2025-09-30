import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'package:the_exchange_online/data/repository/store_repository/shop_repo.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_state.dart';
import 'package:the_exchange_online/utils/validator.dart';

class CreateShopBloc extends Bloc<CreateShopEvent, CreateShopState> {
  final AuthRepository _authRepository = AppRepository.authRepository;
  final ShopRepository _shopRepository = AppRepository.shopRepository;
  late String _currentShop;
  StreamSubscription? _shopSubscription;

  CreateShopBloc() : super(CreateShopState.empty()) {
    on<CreateShopEvent>((event, emit) {
      transformEvents(const Duration(milliseconds: 900));
    });
    on<NameChanged>((event, emit) async {
      await _mapNameChangedToState(event, emit);
    });
    on<DescriptionChanged>((event, emit) async {
      await _mapDescriptionChangedToState(event, emit);
    });
    on<TenantChanged>((event, emit) async {
      await _mapTenantChangedToState(event, emit);
    });
    on<EmailChanged>((event, emit) async {
      await _mapEmailChangedToState(event, emit);
    });
    on<PhoneNumberChanged>((event, emit) async {
      await _mapPhoneNumberChangedToState(event, emit);
    });
    on<LogoChanged>((event, emit) async {
      await _mapLogoChangedToState(event, emit);
    });
    on<CreateShop>((event, emit) async {
      await _mapCreateShopToState(event, emit);
    });
  }

  EventTransformer<CreateShopEvent> transformEvents(Duration duration) {
    return (Stream<CreateShopEvent> events, mapper) {
      var debounceStream = events
          .where(
            (event) =>
                event is NameChanged ||
                event is DescriptionChanged ||
                event is EmailChanged ||
                event is PhoneNumberChanged ||
                event is LogoChanged,
          )
          .debounceTime(const Duration(milliseconds: 300));
      var nonDebounceStream = events.where(
        (event) =>
            event is! NameChanged &&
            event is! DescriptionChanged &&
            event is! EmailChanged &&
            event is! PhoneNumberChanged &&
            event is! LogoChanged,
      );
      return MergeStream([nonDebounceStream, debounceStream]).switchMap(mapper);
    };
  }

  //Create shop
  Future<void> _mapNameChangedToState(
    event,
    Emitter<CreateShopState> emit,
  ) async {
    String name = event.name;
    emit(state.update(isNameValid: UtilValidators.isValidName(name)));
  }

  //Delete shop
  Future<void> _mapDescriptionChangedToState(
    event,
    Emitter<ShopState> emit,
  ) async {
    String description = event.description;
    emit(
      state.update(
        isDescriptionValid: UtilValidators.isValidDescription(description),
      ),
    );
  }

  /// Map from email changed event => states
  Future<void> _mapEmailChangedToState(
    event,
    Emitter<CreateShopState> emit,
  ) async {
    String email = event.email;
    emit(state.update(isEmailValid: UtilValidators.isValidEmail(email)));
  }

  Future<void> _mapPhoneNumberChangedToState(event, Emitter<CreateShopState> emit) async {
    String phone = event.phoneNumber;
    emit(state.update(
      isPhoneValid: UtilValidators.isValidPhoneNumber(phone),
    ));
  }

  @override
  Future<void> close() {
    _shopSubscription?.cancel();
    return super.close();
  }
}
