import 'package:the_exchange_online/presentation/widgets/custom_widgets.dart';
import 'package:the_exchange_online/utils/utils.dart';
import 'package:flutter/material.dart';

class PaymentFeesWidget extends StatelessWidget {
  final double priceOfGoods;
  final double deliveryFee;
  final double coupon;
  final double priceToBePaid;

  const PaymentFeesWidget({
    super.key,
    required this.priceOfGoods,
    required this.deliveryFee,
    required this.coupon,
    required this.priceToBePaid,
  });
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRow(
            title: Translate.of(context).translate("total"),
            content: priceToBePaid.toPrice(),
            isSpaceBetween: true,
          ),
          TextRow(
            title: Translate.of(context).translate("price_of_goods"),
            content: priceOfGoods.toPrice(),
          ),
          TextRow(
            title: Translate.of(context).translate("delivery_fee"),
            content: deliveryFee.toPrice(),
          ),
          TextRow(
            title: Translate.of(context).translate("coupon"),
            content: coupon.toPrice(),
          ),
        ],
      ),
    );
  }
}
