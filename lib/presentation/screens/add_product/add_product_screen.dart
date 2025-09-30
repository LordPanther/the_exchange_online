import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/presentation/common_blocs/create_shop/create_shop_bloc.dart';
import 'package:the_exchange_online/presentation/screens/add_product/widget/add_product_body.dart';
import 'package:the_exchange_online/presentation/screens/add_product/widget/add_product_header.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize * 20),
                child: const Column(
                  children: [
                    AddProductHeader(),
                    AddProductBody(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
