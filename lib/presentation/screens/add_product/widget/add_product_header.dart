import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/config.dart';

class AddProductHeader extends StatefulWidget {
  const AddProductHeader({super.key});

  @override
  State<AddProductHeader> createState() => _AddProductHeaderState();
}

class _AddProductHeaderState extends State<AddProductHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.CENTER);
          },
          icon: const Icon(
            CupertinoIcons.arrow_left,
          ),
          iconSize: SizeConfig.defaultSize * 4,
        )
      ],
    );
  }
}
