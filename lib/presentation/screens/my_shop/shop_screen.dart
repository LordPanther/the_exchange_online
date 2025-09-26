import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/bloc/shop_bloc.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/bloc/shop_event.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_body.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_footer.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/widgets/shop_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc()..add(LoadShop()),
      child: Builder(
        builder: (context) {
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
                      delegate: SliverChildListDelegate(
                        [
                          const ShopBody(),
                        ],
                      ),
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
        },
      ),
    );
  }
}

class _ShopHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _ShopHeaderDelegate({required this.child});

  @override
  double get minExtent =>
      SizeConfig.defaultSize * 20; // Adjust this value as needed
  @override
  double get maxExtent =>
      SizeConfig.defaultSize * 20; // Adjust this value as needed

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
