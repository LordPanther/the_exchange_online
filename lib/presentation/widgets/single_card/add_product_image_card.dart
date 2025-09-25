import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/config.dart';

class AddProductImageCard extends StatelessWidget {
  final Function() onTap;
  const AddProductImageCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          minWidth: SizeConfig.defaultSize * 10,
          minHeight: SizeConfig.defaultSize * 10,
        ),
        width: SizeConfig.defaultSize * 15,
        height: SizeConfig.defaultSize * 15,
        color: Colors.blueGrey,
        child: Icon(
          Icons.add_photo_alternate,
          color: Colors.white,
          size: SizeConfig.defaultSize * 5,
        ),
      ),
    );
  }
}
