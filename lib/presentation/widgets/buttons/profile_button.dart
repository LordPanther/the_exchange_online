import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/constants.dart';

class ProfileButton extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final VoidCallback onPressed;

  const ProfileButton({
    super.key,
    this.name,
    this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: imageUrl != null && imageUrl!.isNotEmpty
          ? CircleAvatar(
              radius: SizeConfig.defaultSize * 1.5, // diameter 30
              backgroundImage: NetworkImage(imageUrl!),
              backgroundColor: COLOR_CONST.lightGrey,
            )
          : CircleAvatar(
              radius: SizeConfig.defaultSize * 1.5,
              backgroundColor: COLOR_CONST.lightGrey,
              child: Icon(Icons.person, size: SizeConfig.defaultSize * 2),
            ),
      iconSize: SizeConfig.defaultSize * 3,
      tooltip: name ?? "Profile",
    );
  }
}
