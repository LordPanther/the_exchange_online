import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/presentation/widgets/custom_widgets.dart';
import 'package:the_exchange_online/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:the_exchange_online/configs/size_config.dart';

class CategoryModelCard extends StatelessWidget {
  const CategoryModelCard({
    super.key,
    required this.category,
    this.onPressed,
  });

  final CategoryModel category;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          ShimmerImage(
            borderRadius: BorderRadius.circular(5),
            imageUrl: category.imageUrl ?? '',
          ),
          Positioned(
            bottom: SizeConfig.defaultSize,
            left: SizeConfig.defaultSize * 2,
            child: Text(
              Translate.of(context).translate(category.name ?? ''),
              style: FONT_CONST.BOLD_WHITE_22,
            ),
          ),
        ],
      ),
    );
  }
}
