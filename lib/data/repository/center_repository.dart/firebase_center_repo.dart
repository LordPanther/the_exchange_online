import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/data/repository/center_repository.dart/center_repo.dart';

class FirebaseCenterRepository implements CenterRepository {
  final _center = FirebaseFirestore.instance;
  List<ShopModel>? stores = [];

  @override
  Future<List<ShopModel>?> fetchCenterStores() async {
    List<ShopModel> stores = [];
    try {
      QuerySnapshot snapshot = await _center.collection("stores").get();

      stores = snapshot.docs.map((doc) {
        return ShopModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching stores: $error");
    }
    return stores;
  }

  @override
  Future<List<BannerModel>?> fetchCenterBanners() async {
    List<BannerModel> banners = [];
    try {
      QuerySnapshot snapshot = await _center.collection("center_banners").get();

      banners = snapshot.docs.map((doc) {
        return BannerModel.fromMap({
          ...doc.data() as Map<String, dynamic>, 
          'id': doc.id, // Include the unique document ID if needed
        });
      }).toList();
    } catch (error) {
      debugPrint("Error fetching banners: $error");
    }
    return banners;
  }

  @override
  Future<List<CategoryModel>?> fetchCenterCategories() async {
    List<CategoryModel> stores = [];
    try {
      QuerySnapshot snapshot = await _center
          .collection("centercategories")
          .get();

      stores = snapshot.docs.map((doc) {
        return CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching categories: $error");
    }
    return stores;
  }

  @override
  Future<List<ProductModel>?> fetchCenterPopularProducts() async {
    List<ProductModel> stores = [];
    try {
      QuerySnapshot snapshot = await _center.collection("stores").get();

      stores = snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching popular products: $error");
    }
    return stores;
  }
}
