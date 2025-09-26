import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/bloc/create_shop_bloc.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/widgets/create_shop_footer.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/widgets/create_shop_form.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/widgets/create_shop_header.dart';

class CreateShopScreen extends StatelessWidget {
  const CreateShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateShopBloc(),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: _CreateShopHeaderDelegate(
                        child: const CreateShopHeader(),
                      ),
                      pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        const CreateShopForm(),
                      ]),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: CreateShopFooter(),
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

class _CreateShopHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _CreateShopHeaderDelegate({required this.child});

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
