import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/utils/translate.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.store,
    this.onPressed,
  });

  final ShopModel store;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(store.logo!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.defaultSize,
            left: SizeConfig.defaultSize,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      store.tenant!.avatar!), // Replace with your avatar URL
                ),
                Text(
                  Translate.of(context).translate(store.name!),
                  style: FONT_CONST.BOLD_WHITE_22,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                buildStarRating(store.rating),
                const SizedBox(width: 10),
                const Text(
                  '4.5',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStarRating(int? rating) {
    double rate = rating! / 5;
    int fullStars = rate.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < fullStars) {
            return const Icon(Icons.star, color: Colors.yellowAccent, size: 20);
          } else if (index == fullStars && hasHalfStar) {
            return const Icon(Icons.star_half,
                color: Colors.yellowAccent, size: 20);
          } else {
            return const Icon(Icons.star_border,
                color: Colors.yellowAccent, size: 20);
          }
        },
      ),
    );
  }
}
