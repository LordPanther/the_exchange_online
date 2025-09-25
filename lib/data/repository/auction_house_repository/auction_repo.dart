import 'package:the_exchange_online/data/models/auction_item_model.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/models/category_model.dart';

abstract class AuctionRepository {
  Future<List<BannerModel>?> fetchAuctionBanners();
  Future<List<CategoryModel>?> fetchAuctionCategories();
  Future<List<AuctionItemModel>?> fetchAuctionItems();
}