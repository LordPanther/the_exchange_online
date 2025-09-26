import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/constants/icon_constant.dart';
import 'package:the_exchange_online/constants/image_constant.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/bloc/shop_bloc.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/bloc/shop_event.dart';
import 'package:the_exchange_online/presentation/screens/my_shop/bloc/shop_state.dart';

import 'package:the_exchange_online/presentation/widgets/others/custom_dismissible.dart';
import 'package:the_exchange_online/presentation/widgets/single_card/add_product_image_card.dart';
import 'package:the_exchange_online/presentation/widgets/single_card/product_image_card.dart';
import 'package:the_exchange_online/utils/dialog.dart';
import 'package:the_exchange_online/utils/translate.dart';

class ShopBody extends StatefulWidget {
  const ShopBody({super.key});

  @override
  State<ShopBody> createState() => _ShopBodyState();
}

class _ShopBodyState extends State<ShopBody> {
  ProductModel? _selectedProduct;

  void _onDismissed(BuildContext context, ProductModel product) {
    BlocProvider.of<ShopBloc>(context).add(DeleteProduct(product));
  }

  void _onEditProduct(ProductModel product) {
    ///Show edit product dialog
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Center(
    //       child: Text(
    //         "SHOP SCREEN",
    //         style: FONT_CONST.BOLD_BLACK_28,
    //       ),
    //     )
    //   ],
    // );
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopLoading) {
          UtilDialog.showWaiting(context);
        } else {
          UtilDialog.hideWaiting(context);
        }

        if (state is ShopLoadError) {
          UtilDialog.showInformation(context, content: state.error);
        }

        // Navigate to shop screen after creation
        if (state is ShopLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => ShopBody()));
          });
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, shopState) {
          if (shopState is ShopLoaded) {
            var shop = shopState.shop;
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildStoreProducts(shop!.products),
                  SizedBox(height: SizeConfig.defaultSize * 10),
                  _buildStoreProductDetails(),
                ],
              ),
            );
          }
          if (shopState is ShopNotFound) {
            Navigator.of(context).pushReplacementNamed(AppRouter.CREATE_SHOP);
          }
          return const Center(child: Text("Something went wrong."));
        },
      ),
    );
  }

  _buildStoreProducts(List<ProductModel>? products) {
    return products!.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              if (index == products.length) {
                return AddProductImageCard(
                  onTap: () => Navigator.pushNamed(context, ""),
                );
              }
              return CustomDismissible(
                key: Key(products[index].id!),
                onDismissed: (direction) {
                  _onDismissed(context, products[index]);
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedProduct = products[index];
                    });
                  },
                  child: ProductImageCard(
                    productImage: products[index].image![0],
                    productName: products[index].name,
                  ),
                ),
              );
            },
          )
        : Center(
            child: AddProductImageCard(
              onTap: () => Navigator.pushNamed(context, AppRouter.ADD_PRODUCT),
            ),
          );
  }

  _buildStoreProductDetails() {
    if (_selectedProduct == null) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///Product images
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _selectedProduct!.image!.length,
          itemBuilder: (context, index) {
            return ProductImageCard(
              productImage: _selectedProduct!.image![index],
            );
          },
        ),
        SizedBox(height: SizeConfig.defaultSize),

        ///Product name
        Text(
          _selectedProduct!.name ?? '',
          style: FONT_CONST.BOLD_DEFAULT_20,
          maxLines: 2,
        ),

        ///Price ad availability
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedProduct!.originalPrice!.toPrice(),
              style: FONT_CONST.BOLD_PRIMARY_20,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              width: SizeConfig.defaultSize * 2.4,
              height: SizeConfig.defaultSize * 2.4,
              decoration: BoxDecoration(
                color: (_selectedProduct!.isAvailable ?? false)
                    ? const Color(0xFFFFE6E6)
                    : const Color(0xFFF5F6F9),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ICON_CONST.CHECK_MARK,
                colorFilter: ColorFilter.mode(
                  (_selectedProduct!.isAvailable ?? false)
                      ? const Color(0xFFFF4848)
                      : Colors.black26,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),

        ///Sold quantity
        Text.rich(
          TextSpan(
            style: FONT_CONST.REGULAR_DEFAULT_16,
            children: [
              TextSpan(text: Translate.of(context).translate("sold")),
              TextSpan(
                text: " ${_selectedProduct!.soldQuantity}",
                style: FONT_CONST.BOLD_DEFAULT_20,
              ),
              TextSpan(text: " ${Translate.of(context).translate("products")}"),
            ],
          ),
        ),

        ///Percent off
        Text("-${_selectedProduct!.percentOff}%", style: FONT_CONST.BOLD_WHITE),
      ],
    );
  }
}

extension DoubleExtensions on double {
  String toPrice() {
    return '\$${toStringAsFixed(2)}';
  }
}
