import 'package:the_exchange_online/data/repository/auction_house_repository/firebase_auction_repo.dart';
import 'package:the_exchange_online/data/repository/banner_repository/firebase_banner_repo.dart';
import 'package:the_exchange_online/data/repository/cart_repository/firebase_cart_repo.dart';
import 'package:the_exchange_online/data/repository/center_repository.dart/firebase_center_repo.dart';
import 'package:the_exchange_online/data/repository/location_repository/location_repo.dart';
import 'package:the_exchange_online/data/repository/order_repository/firebase_order_repo.dart';
import 'package:the_exchange_online/data/repository/product_repository/firebase_product_repo.dart';
import 'package:the_exchange_online/data/repository/repository.dart';
import 'package:the_exchange_online/data/repository/store_repository/firebase_shop_repo.dart';

class AppRepository {
  /// Repository
  static final authRepository = FirebaseAuthRepository();
  static final bannerRepository = FirebaseBannerRepository();
  static final centerRepository = FirebaseCenterRepository();
  static final shopRepository = FirebaseShopRepository();
  static final productRepository = FirebaseProductRepository();
  static final cartRepository = FirebaseCartRepository();
  static final orderRepository = FirebaseOrderRepository();
  static final userRepository = FirebaseUserRepository();
  static final feedbackRepository = FirebaseFeedbackRepository();
  static final messageRepository = FirebaseMessageRepository();
  static final locationRepository = LocationRepository();
  static final auctionRepository = FirebaseAuctionRepository();

  /// Singleton factory
  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository() {
    return _instance;
  }
  AppRepository._internal();
}
