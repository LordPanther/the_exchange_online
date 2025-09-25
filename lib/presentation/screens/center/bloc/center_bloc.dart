import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/data/repository/app_repository.dart';
import 'package:the_exchange_online/data/repository/center_repository.dart/center_repo.dart';
import 'package:the_exchange_online/data/repository/product_repository/product_repo.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/center_event.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/center_state.dart';

class CenterBloc extends Bloc<CenterEvent, CenterState> {
  final CenterRepository _centerRepository = AppRepository.centerRepository;
  final ProductRepository _productRepository = AppRepository.productRepository;

  CenterBloc() : super(CenterLoading()) {
    on<LoadCenter>((event, emit) async {
      await _mapLoadCenterToState(event, emit);
    });
  }

  Future<void> _mapLoadCenterToState(event, Emitter<CenterState> emit) async {
    try {
      CenterResponse centerResponse = CenterResponse(
        shops: await _centerRepository.fetchCenterStores(),
        banners: await _centerRepository.fetchCenterBanners(),
        categories: await _productRepository.fetchCenterCategories(),
        popularProducts: await _productRepository.fetchCenterPopularProducts(),
      );
      emit(CenterLoaded(centerResponse: centerResponse));
    } catch (error) {
      emit(CenterLoadFailure(error.toString()));
    }
  }
}

class CenterResponse {
  final List<BannerModel>? banners;
  final List<ShopModel>? shops;
  final List<CategoryModel>? categories;
  final List<ProductModel>? popularProducts;

  CenterResponse({
    required this.banners,
    required this.shops,
    required this.categories,
    required this.popularProducts,
  });
}
