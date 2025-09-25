import 'package:the_exchange_online/data/models/banner_model.dart';

abstract class BannerRepository {
  Future<List<BannerModel>> fetchCenterBanners();

  Future<List<BannerModel>> fetchBanners();

}
