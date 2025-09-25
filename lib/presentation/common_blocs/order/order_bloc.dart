import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/data/models/order_model.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/auth_repository/auth_repo.dart';
import 'package:the_exchange_online/data/repository/order_repository/order_repo.dart';
import 'package:the_exchange_online/presentation/common_blocs/order/order_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/order/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository = AppRepository.orderRepository;
  final AuthRepository _authRepository = AppRepository.authRepository;
  OrderBloc() : super(MyOrdersLoading()) {
    on<LoadMyOrders>((event, emit) async {
      await _mapLoadMyOrdersToState(event, emit);
    });
    on<AddOrder>((event, emit) async {
      await _mapAddOrderToState(event, emit);
    });
    on<RemoveOrder>((event, emit) async {
      await _mapRemoveOrderToState(event, emit);
    });
  }

  Future<void> _mapLoadMyOrdersToState(event, Emitter<OrderState> emit) async {
    try {
      var loggedFirebaseUser = _authRepository.userId;
      List<OrderModel> orders =
          await _orderRepository.fetchOrders(loggedFirebaseUser!);

      // Classify orders
      List<OrderModel> deliveringOrders = [];
      List<OrderModel> deliveredOrders = [];

      for (var order in orders) {
        if (order.isDelivering == true) {
          deliveringOrders.add(order);
        } else {
          deliveredOrders.add(order);
        }
      }
      emit(MyOrdersLoaded(
        deliveringOrders: deliveringOrders,
        deliveredOrders: deliveredOrders,
      ));
    } catch (e) {
      emit(MyOrdersLoadFailure(e.toString()));
    }
  }

  Future<void> _mapAddOrderToState(event, Emitter<OrderState> emit) async {
    try {
      var newOrderModel =
          event.newOrderModel.cloneWith(uid: _authRepository.userId);
      await _orderRepository.addOrderModel(newOrderModel);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _mapRemoveOrderToState(event, Emitter<OrderState> emit) async {
    try {
      await _orderRepository.removeOrderModel(event.order);
      add(LoadMyOrders());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
