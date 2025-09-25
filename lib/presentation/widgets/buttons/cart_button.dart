import 'package:flutter/material.dart';
import 'package:the_exchange_online/presentation/common_blocs/cart/bloc.dart';
import 'package:the_exchange_online/configs/router.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'icon_button_with_counter.dart';

class CartButton extends StatelessWidget {
  final Color color;

  const CartButton({
    super.key,
    this.color = COLOR_CONST.secondary,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        buildWhen: (prevState, currState) => currState is CartLoaded,
        builder: (context, state) {
          return IconButtonWithCounter(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, "AppRouter.CART"),
            counter: state is CartLoaded ? state.cart.length : 0,
            size: SizeConfig.defaultSize * 3,
            color: color,
          );
        });
  }
}
