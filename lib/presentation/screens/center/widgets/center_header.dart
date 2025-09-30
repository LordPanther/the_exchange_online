import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/constants/image_constant.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/auth/auth_state.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/cart_button.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/center_button.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/profile_button.dart';
import 'package:the_exchange_online/presentation/widgets/others/search_field_widget.dart';
import 'package:the_exchange_online/utils/auth_cycle_handler.dart';
import 'package:the_exchange_online/utils/formatter.dart';

class CenterHeader extends StatefulWidget {
  const CenterHeader({super.key});

  @override
  State<CenterHeader> createState() => _CenterHeaderState();
}

class _CenterHeaderState extends State<CenterHeader> {
  late final AuthManager authManager;

  @override
  void initState() {
    super.initState();
    authManager = AuthManager(context);
  }

  void onNavigate(String route) async {
    switch (route) {
      case "sell":
        authManager.signIn("/my_shop");
        break;
      case "sign_in":
        authManager.signIn("/center");
        break;
      case "sign_up":
        authManager.signUp("/center");
        break;
      case "sign_out":
        authManager.signOut();
        break;
      default:
        if (kDebugMode) print("Error navigating");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, listener) {},
      builder: (context, builder) {
        return Column(children: [_buildAppBar(builder), _buildSearchBar()]);
      },
    );
  }

  _buildAppBar(AuthenticationState builder) {
    return Container(
      height: SizeConfig.defaultSize * 8,
      width: double.maxFinite,
      color: COLOR_CONST.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
          vertical: double.minPositive,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IMAGE_CONST.LOGO,
                  width: SizeConfig.defaultSize * 20,
                  height: double.maxFinite,
                ),
                CenterButton(
                  name: "Help",
                  onPressed: () {
                    Navigator.pushNamed(context, "AppRouter.HELP_CENTER");
                  },
                ),
                Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
                builder is Authenticated
                    ? CenterButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.MY_SHOP);
                        },
                        name: "My Shop",
                      )
                    : CenterButton(
                        name: "Sell",
                        onPressed: () => onNavigate("sell"),
                      ),
                Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
                CenterButton(
                  name: "Auction House",
                  onPressed: () {
                    Navigator.pushNamed(context, "AppRouter.AUCTION_HOUSE");
                  },
                ),
              ],
            ),
            Row(
              children: [
                builder is Authenticated
                    ? _buildAuthed(builder.loggedFirebaseUser.email!)
                    : _buildUnauthed(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildAuthed(String email) {
    return Row(
      children: [
        CenterButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.PROFILE);
          },
          name: UtilFormatter.getDisplayName(email),
        ),
        Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
        const CartButton(),
        ProfileButton(onPressed: () => onNavigate("sign_out")),
      ],
    );
  }

  _buildUnauthed() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CenterButton(name: "Sign In", onPressed: () => onNavigate("sign_in")),
        Text("|", style: FONT_CONST.REGULAR_DEFAULT_16),
        CenterButton(name: "Sign Up", onPressed: () => onNavigate("sign_up")),
      ],
    );
  }

  _buildSearchBar() {
    return Container(
      height: SizeConfig.defaultSize * 7,
      width: double.maxFinite,
      color: COLOR_CONST.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
          vertical: SizeConfig.defaultSize * 1.5,
        ),
        child: SearchFieldWidget(
          onTap: () {},
          hintText: "Search for shop, products, or brands...",
        ),
      ),
    );
  }
}
