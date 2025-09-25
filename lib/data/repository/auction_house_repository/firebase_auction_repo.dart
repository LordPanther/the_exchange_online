import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/data/models/auction_item_model.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/repository/auction_house_repository/auction_repo.dart';

class FirebaseAuctionRepository implements AuctionRepository {
  final _auction = FirebaseFirestore.instance;

  @override
  Future<List<BannerModel>?> fetchAuctionBanners() async {
    List<BannerModel> banners = [];
    try {
      QuerySnapshot snapshot = await _auction.collection("auctionbanners").get();

      banners = snapshot.docs.map((doc) {
        return BannerModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching banners: $error");
    }
    return banners;
  }

  @override
  Future<List<CategoryModel>?> fetchAuctionCategories() async {
    List<CategoryModel> categories = [];
    try {
      QuerySnapshot snapshot = await _auction.collection("auctionCategories").get();

      categories = snapshot.docs.map((doc) {
        return CategoryModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching categories: $error");
    }
    return categories;
  }

  @override
  Future<List<AuctionItemModel>?> fetchAuctionItems() async {
    List<AuctionItemModel> items = [];
    try {
      QuerySnapshot snapshot = await _auction.collection("auctionItems").get();

      items = snapshot.docs.map((doc) {
        return AuctionItemModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching auction items: $error");
    }
    return items;
  }
}
