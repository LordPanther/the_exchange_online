import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/bloc.dart';
import 'package:the_exchange_online/presentation/screens/center/widgets/center_banner.dart';
import 'package:the_exchange_online/utils/translate.dart';
import 'package:the_exchange_online/utils/utils.dart';

import '../../../widgets/others/loading.dart';
import '../../../widgets/others/promo_widget.dart';
import '../../../widgets/others/section_widget.dart';
import '../../../widgets/single_card/category_card.dart';
import '../../../widgets/single_card/product_card.dart';
import '../../../widgets/single_card/store_card.dart';

class CenterBody extends StatelessWidget {
  const CenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CenterBloc, CenterState>(
      builder: (context, centreState) {
        if (centreState is CenterLoaded) {
          var centerResponse = centreState.centerResponse;
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize * 1,
              horizontal: SizeConfig.defaultSize * 2,
            ),
            child: Column(
              children: [
                ///Home Banner
                CenterBanner(banners: centerResponse.banners),

                ///Shops
                _buildStores(
                  context,
                  centerResponse.shops,
                ),

                ///Product Categories
                _buildCenterCategories(
                  context,
                  centerResponse.categories,
                ),

                ///Promotion widget
                PromoWidget(),

                ///Popular products
                _buildPopularProducts(
                  context,
                  centerResponse.popularProducts,
                ),
              ],
            ),
          );
        }
        if (centreState is CenterLoading) {
          return const Loading();
        }
        if (centreState is CenterLoadFailure) {
          return Center(child: Text(centreState.error));
        }
        return const Center(
          child: Text("Something went wrong."),
        );
      },
    );
  }

  _buildCenterCategories(
      BuildContext context, List<CategoryModel>? categories) {
  return Container(
    padding: EdgeInsets.only(
      left: SizeConfig.defaultPadding,
      bottom: SizeConfig.defaultPadding),
    height: SizeConfig.defaultSize * 4.5, // ~90px for 20 defaultSize
      child: ListView.builder(
        scrollDirection:
            Axis.horizontal, // Set the scroll direction to horizontal
        itemCount: categories!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 20), // Add spacing between items
            child: CategoryModelCard(
              category: categories[index],
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "AppRouter.CATEGORIES",
                  arguments: categories[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  _buildStores(BuildContext context, List<ShopModel>? stores) {
    return SectionWidget(
      title: Translate.of(context).translate('stores'),
      children: stores!.map((store) => StoreCard(store: store)).toList(),
    );
  }

  //Product category section below carousel area | horizontal scrolling
  _buildPopularProducts(
      BuildContext context, List<ProductModel>? popularProducts) {
    return SectionWidget(
      title: Translate.of(context).translate('popular_products'),
      children: popularProducts!.map((p) => ProductCard(product: p)).toList(),
    );
  }
}
