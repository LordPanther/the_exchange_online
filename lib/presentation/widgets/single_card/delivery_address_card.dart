import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/data/models/delivery_address_model.dart';
import 'package:the_exchange_online/presentation/widgets/custom_widgets.dart';
import 'package:the_exchange_online/utils/translate.dart';
import 'package:flutter/material.dart';

class DeliveryAddressCard extends StatelessWidget {
  final DeliveryAddressModel deliveryAddress;
  final Function()? onPressed;
  final bool showDefautTick;

  const DeliveryAddressCard({
    super.key,
    required this.deliveryAddress,
    this.onPressed,
    this.showDefautTick = true,
  });
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                Translate.of(context).translate("delivery_address"),
                style: FONT_CONST.BOLD_PRIMARY_20,
              ),
              Spacer(),
              _buildDefaultText(context),
            ],
          ),
          TextRow(
            title: Translate.of(context).translate("name"),
            content: deliveryAddress.recieverName!,
          ),
          TextRow(
            title: Translate.of(context).translate("phone_number"),
            content: deliveryAddress.phoneNumber!,
          ),
          TextRow(
            title: Translate.of(context).translate("detail_address"),
            content: deliveryAddress.toString(),
          ),
        ],
      ),
    );
  }

  _buildDefaultText(BuildContext context) {
    return deliveryAddress.isDefault! && showDefautTick
        ? Text(
            "[${Translate.of(context).translate("default")}]",
            style: FONT_CONST.REGULAR_PRIMARY,
          )
        : Container();
  }
}
