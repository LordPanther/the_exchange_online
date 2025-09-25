import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:the_exchange_online/presentation/widgets/buttons/control_panel_button.dart';

class CenterFooter extends StatelessWidget {
  const CenterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Control Panel
        _buildCluster(context),
        //Credits
        _buildCredits(context),
      ],
    );
  }

  _buildCluster(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize * 25,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 3,
          vertical: SizeConfig.defaultSize * 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Help", style: FONT_CONST.BOLD_DEFAULT_20),
                SizedBox(height: SizeConfig.defaultSize),
                PanelButton(
                  name: "Help Center",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.HELP_CENTER");
                  },
                ),
                PanelButton(
                  name: "Contact Us",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.CONTACT_US");
                  },
                ),
                PanelButton(
                  name: "Submit an Idea",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.SUBMIT_IDEA");
                  },
                ),
                PanelButton(
                  name: "Suggest a Product",
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed("AppRouter.SUGGEST_PRODUCT");
                  },
                ),
                PanelButton(
                  name: "Shipping & Delivery",
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed("AppRouter.SHIPPING_DELIVERY");
                  },
                ),
                PanelButton(
                  name: "Returns",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.RETURNS");
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text("Account", style: FONT_CONST.BOLD_DEFAULT_20),
                SizedBox(height: SizeConfig.defaultSize),
                PanelButton(
                  name: "My Account",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.CONTACT_US");
                  },
                ),
                PanelButton(
                  name: "Track Order",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.SUBMIT_IDEA");
                  },
                ),
                PanelButton(
                  name: "Returns",
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed("AppRouter.SUGGEST_PRODUCT");
                  },
                ),
                PanelButton(
                  name: "Personal Details",
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed("AppRouter.SHIPPING_DELIVERY");
                  },
                ),
                PanelButton(
                  name: "Invoices",
                  onTap: () {
                    Navigator.of(context).pushNamed("AppRouter.RETURNS");
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text("Company", style: FONT_CONST.BOLD_DEFAULT_20),
                SizedBox(height: SizeConfig.defaultSize),
                PanelButton(name: "About Us", onTap: () {}),
                PanelButton(name: "Careers", onTap: () {}),
                PanelButton(name: "Sell on Exchange", onTap: () {}),
                PanelButton(name: "Report a Crime", onTap: () {}),
                PanelButton(name: "News", onTap: () {}),
                PanelButton(name: "Competitions", onTap: () {}),
                PanelButton(name: "Terms & Conditions", onTap: () {}),
                PanelButton(name: "Privacy Policy", onTap: () {}),
              ],
            ),
            Column(
              children: [
                Text("Donwload Our Apps", style: FONT_CONST.BOLD_DEFAULT_20),
                SizedBox(height: SizeConfig.defaultSize),
                Image.asset(
                  width: SizeConfig.defaultSize * 15,
                  IMAGE_CONST.APP_STORE,
                ),
                SizedBox(height: SizeConfig.defaultSize * 0.5),
                Image.asset(
                  width: SizeConfig.defaultSize * 15,
                  IMAGE_CONST.GOOGLE_PLAY,
                ),
                SizedBox(height: SizeConfig.defaultSize),
                PanelButton(name: "Follow Us", onTap: () {}),
                SizedBox(height: SizeConfig.defaultSize),

                //Social Media Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      width: SizeConfig.defaultSize * 3,
                      IMAGE_CONST.FACEBOOK_LOGO,
                    ),
                    SizedBox(width: SizeConfig.defaultSize),
                    Image.asset(
                      width: SizeConfig.defaultSize * 3,
                      IMAGE_CONST.TWITTER_LOGO,
                    ),
                    SizedBox(width: SizeConfig.defaultSize),
                    Image.asset(
                      width: SizeConfig.defaultSize * 3,
                      IMAGE_CONST.INSTAGRAM_LOGO,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildCredits(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize * 7,
      color: Colors.blueAccent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  IMAGE_CONST.VISA,
                  width: SizeConfig.defaultSize * 5,
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Image.asset(
                  IMAGE_CONST.MASTERCARD,
                  width: SizeConfig.defaultSize * 5,
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Image.asset(
                  IMAGE_CONST.YOCO,
                  width: SizeConfig.defaultSize * 5,
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Image.asset(
                  IMAGE_CONST.OZOW,
                  width: SizeConfig.defaultSize * 5,
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Image.asset(
                  IMAGE_CONST.EBUCKS,
                  width: SizeConfig.defaultSize * 5,
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Image.asset(
                  IMAGE_CONST.AMAZON,
                  width: SizeConfig.defaultSize * SizeConfig.defaultSize,
                ),
              ],
            ),
            Text(
              "Blackworks Holdings (Pty) Ltd.",
              style: FONT_CONST.MEDIUM_DEFAULT_16,
            ),
          ],
        ),
      ),
    );
  }
}
