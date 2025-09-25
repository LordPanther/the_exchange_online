import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/data/models/order_model.dart';
import 'package:the_exchange_online/data/repository/order_repository/order_repo.dart';

/// cart is collection in each user
class FirebaseOrderRepository implements OrderRepository {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final order = FirebaseFirestore.instance;
  User get user => _firebaseAuth.currentUser!;
  
  @override
  Future<List<OrderModel>> fetchOrders(String uid) async {
    return [];
  }

  @override
  Future<void> addOrderModel(OrderModel newOrder) async {
    try {
      await order
          .collection("users")
          .doc(user.uid)
          .collection("orders")
          .doc(newOrder.id)
          .set({newOrder.id: newOrder.toMap()}, SetOptions(merge: true));
    } catch (error) {
        debugPrint("error");
    }
  }

  @override
  Future<void> removeOrderModel(OrderModel order) async {}

  ///Singleton factory
  static final FirebaseOrderRepository _instance =
      FirebaseOrderRepository._internal();

  factory FirebaseOrderRepository() {
    return _instance;
  }

  FirebaseOrderRepository._internal();
}
