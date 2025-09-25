import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  final List<Map<String, dynamic>> coupons = [
    {
      "content": "Save R200 with orders from R2000 and up",
      "expDate": "05/04/2021"
    },
    {
      "content": "Save R500 with orders from R5000 and up",
      "expDate": "10/04/2021"
    },
    {
      "content": "Save R1000 with orders from R12000 and up",
      "expDate": "30/04/2021"
    }
  ];

  PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultPadding,
          vertical: SizeConfig.defaultSize,
        ),
        child: Row(
          children: List.generate(
              coupons.length,
              (index) => _buildCouponCard(
                    coupons[index]["content"],
                    coupons[index]["expDate"],
                  )),
        ),
      ),
    );
  }

  _buildCouponCard(String content, String expireDate) {
    return Container(
      constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.75),
      padding: EdgeInsets.all(SizeConfig.defaultPadding),
      margin: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
      decoration: BoxDecoration(
        border: const Border(
          left: BorderSide(color: COLOR_CONST.primaryColor, width: 6),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: COLOR_CONST.greyColor.withOpacity(0.3),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: FONT_CONST.BOLD_DEFAULT_20,
            maxLines: 2,
            textWidthBasis: TextWidthBasis.longestLine,
          ),
          const SizedBox(height: 5),
          Text("EXP: $expireDate"),
        ],
      ),
    );
  }
}
