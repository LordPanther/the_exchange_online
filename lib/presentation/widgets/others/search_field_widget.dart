import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final bool readOnly;
  final bool autoFocus;
  final Function()? onTap;
  final String? hintText;
  final double? height;

  const SearchFieldWidget({
    super.key,
    this.readOnly = false,
    this.autoFocus = false,
    this.onTap,
    this.searchController,
    this.hintText = "",
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize * 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 0.5),
        color: COLOR_CONST.whiteColor,
      ),
      child: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        autofocus: autoFocus,
        readOnly: readOnly,
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: FONT_CONST.REGULAR_DEFAULT_16,
          prefixStyle: FONT_CONST.REGULAR_DEFAULT_16,
          contentPadding: EdgeInsets.all(SizeConfig.defaultSize * 2),
          suffixIcon: const Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
