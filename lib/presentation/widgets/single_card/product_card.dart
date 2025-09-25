
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_exchange_online/configs/router.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/constants/icon_constant.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/presentation/widgets/others/custom_card_widget.dart';
import 'package:the_exchange_online/presentation/widgets/others/shimmer_image.dart';
import 'package:the_exchange_online/utils/utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      onTap: () => Navigator.pushNamed(
        context,
        "AppRouter.DETAIL_PRODUCT",
        arguments: product,
      ),
      width: SizeConfig.defaultSize * 18,
      padding: EdgeInsets.all(SizeConfig.defaultSize),
      margin: EdgeInsets.all(SizeConfig.defaultSize * 0.5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              _buildProductName(),
              const SizedBox(height: 3),
              _buildPriceAndAvailable(),
              const SizedBox(height: 3),
              _buildSoldQuantity(context)
            ],
          ),

          // Percent off
          if (product.percentOff != null && product.percentOff! > 0) _buildPercentOff(),
        ],
      ),
    );
  }

  _buildProductImage() {
    return ShimmerImage(
      aspectRatio: 1,
      imageUrl: product.image![0],
    );
  }

  _buildProductName() =>
      Text(product.name ?? '', style: FONT_CONST.BOLD_DEFAULT_20, maxLines: 2);

  _buildPriceAndAvailable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.originalPrice?.toPrice() ?? '',
          style: FONT_CONST.BOLD_PRIMARY_20,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: SizeConfig.defaultSize * 2.4,
          height: SizeConfig.defaultSize * 2.4,
          decoration: BoxDecoration(
            color: (product.isAvailable ?? false)
                ? const Color(0xFFFFE6E6)
                : const Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            ICON_CONST.CHECK_MARK,
            colorFilter: ColorFilter.mode(
              (product.isAvailable ?? false) ? const Color(0xFFFF4848) : Colors.black26,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  _buildSoldQuantity(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          style: FONT_CONST.REGULAR_DEFAULT_16,
          children: [
            TextSpan(text: Translate.of(context).translate("sold")),
            TextSpan(
              text: " ${product.soldQuantity}",
              style: FONT_CONST.BOLD_DEFAULT_20,
            ),
            TextSpan(
              text: " ${Translate.of(context).translate("products")}",
            ),
          ],
        ),
      ),
    );
  }

  _buildPercentOff() {
    return Positioned(
      top: -10,
      right: -10,
      child: ClipPath(
        clipper: CustomDiscountCard(),
        child: Container(
          alignment: Alignment.center,
          height: SizeConfig.defaultSize * 6,
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: COLOR_CONST.discountColor,
          ),
          child: Text("-${product.percentOff}%", style: FONT_CONST.BOLD_WHITE),
        ),
      ),
    );
  }
}

class CustomDiscountCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;

    path.lineTo(0, height);
    path.lineTo(width / 2, height * 0.85);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
