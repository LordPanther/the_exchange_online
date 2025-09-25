import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:flutter/material.dart';

class SellFieldWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool autoFocus;
  final Function()? onTap;
  final ValueChanged onValueChanged;
  final String? hintText;
  final double? height;

  const SellFieldWidget({
    super.key,
    this.readOnly = false,
    this.autoFocus = false,
    this.onTap,
    this.searchController,
    required this.onValueChanged,
    required this.textInputType,
    required this.hintText,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      keyboardType: textInputType,
      autofocus: autoFocus,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onValueChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: FONT_CONST.REGULAR_DEFAULT_14,
        contentPadding: EdgeInsets.all(SizeConfig.defaultSize * 2),
        border: InputBorder.none,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: COLOR_CONST.darkColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: COLOR_CONST.greyColor),
        ),
      ),
    );
  }
}
