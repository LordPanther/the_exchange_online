import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_state.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/create_shop.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_body.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_footer.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc()..add(LoadShop()),
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, shopState) {
          if (shopState is ShopLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (shopState is ShopLoadError) {
            return Center(child: Text(shopState.error));
          }
          if (shopState is ShopNotFound) {
            // You can use your _buildRegisterStoreForm here or a dedicated widget
            return CreateShopScreen(); // ShopBody will show the registration form
          }
          if (shopState is ShopLoaded) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        delegate: _ShopHeaderDelegate(
                          child: const ShopHeader(),
                        ),
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([ShopBody(shop:shopState.shop)]),
                      ),
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: ShopFooter(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: Text("Unknown state"));
        },
      ),
    );
  }
}

class _ShopHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _ShopHeaderDelegate({required this.child});

  @override
  double get minExtent => SizeConfig.defaultSize * 20; // Adjust this value as needed
  @override
  double get maxExtent => SizeConfig.defaultSize * 20; // Adjust this value as needed

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
