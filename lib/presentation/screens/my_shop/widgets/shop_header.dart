import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/router.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_state.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/center_button.dart';
import 'package:the_exchange_online/presentation/widgets/others/search_field_widget.dart';
import 'package:the_exchange_online/utils/auth_cycle_handler.dart';

class ShopHeader extends StatefulWidget {
  const ShopHeader({super.key});

  @override
  State<ShopHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<ShopHeader> {
  // late final AuthManager authManager;

  // @override
  // void initState() {
  //   super.initState();
  //   authManager = AuthManager(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildAppBar(), _buildSearchBar()]);
  }

  Widget _buildAppBar() {
    return Container(
      height: SizeConfig.defaultSize * 10,
      width: double.maxFinite,
      color: COLOR_CONST.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 10,
          vertical: SizeConfig.defaultSize * 1.5,
        ),
        child: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, shopState) {
            // Pass the shopState to the AppBar content
            return _buildAppBarContent(shopState);
          },
        ),
      ),
    );
  }

  Widget _buildAppBarContent(ShopState shopState) {
    final shop = shopState is ShopLoaded ? shopState.shop : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            shop?.logo != null && shop!.logo!.isNotEmpty
                ? Image.network(
                    shop.logo!,
                    width: SizeConfig.defaultSize * 20,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  )
                : CircleAvatar(
                    radius: SizeConfig.defaultSize * 10,
                    backgroundColor: COLOR_CONST.greyColor,
                    child: Icon(
                      Icons.person,
                      size: double.minPositive,
                      color: COLOR_CONST.whiteColor,
                    ),
                  ),
            Text("PowerParts Co. ", style: FONT_CONST.REGULAR_DEFAULT_18),
            Text(" | ", style: FONT_CONST.REGULAR_DEFAULT_16),
            Text(" @lindani_ngubane", style: FONT_CONST.REGULAR_DEFAULT_18),
          ],
        ),
        Row(
          children: [
            CenterButton(
              name: "Analytics",
              onPressed: () {
                Navigator.pushNamed(context, "");
              },
            ),
            Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
            CenterButton(
              name: "Support",
              onPressed: () {
                Navigator.pushNamed(context, "");
              },
            ),
            Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
            CenterButton(
              name: "Contact Us",
              onPressed: () {
                Navigator.pushNamed(context, "");
              },
            ),
          ],
        ),
      ],
    );
  }
}

_buildSearchBar() {
  return Container(
    height: SizeConfig.defaultSize * 10,
    width: double.maxFinite,
    color: COLOR_CONST.primaryColor,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize * 10,
        vertical: SizeConfig.defaultSize * 1.5,
      ),
      child: SearchFieldWidget(
        height: double.maxFinite,
        onTap: () {},
        hintText: "Search anything related to your shop",
      ),
    ),
  );
}
