import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/presentation/widgets/others/shimmer_image.dart';

class ProductImageCard extends StatelessWidget {
  const ProductImageCard({
    super.key,
    this.productImage,
    this.productName,
  });

  final String? productImage;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize * 20,
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return ShimmerImage(
      aspectRatio: 1,
      imageUrl: productImage!,
    );
  }

  Widget _buildProductName() =>
      Text(productName!, style: FONT_CONST.BOLD_DEFAULT_20, maxLines: 2);
}
