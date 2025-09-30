import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_event.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_state.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_body.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_footer.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_header.dart';
import 'package:the_exchange_online/presentation/widgets/dialogs/create_shop_dialog.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc()..add(LoadShop()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ShopBloc, ShopState>(
            builder: (context, shopState) {
              if (shopState is ShopLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (shopState is ShopLoadError) {
                return Center(child: Text(shopState.error));
              }
              if (shopState is ShopNotFound) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: CreateShopScreen(),
                  ),
                );
              }
              if (shopState is ShopLoaded) {
                return CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: _ShopHeaderDelegate(child: const ShopHeader()),
                      pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ShopBody(shop: shopState.shop),
                      ]),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: ShopFooter(),
                    ),
                  ],
                );
              }
              return const Center(child: Text("Unknown state"));
            },
          ),
        ),
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
