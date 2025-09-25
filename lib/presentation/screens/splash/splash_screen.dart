import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/image_constant.dart';
import 'package:the_exchange_online/utils/glassmorphism.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: false);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: COLOR_CONST.whiteColor,
        body: GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.2,
          child: SafeArea(
            child: Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(2 * pi * _animation.value),
                    child: child,
                  );
                },
                child: Container(
                  height: SizeConfig.defaultSize * 30,
                  width: SizeConfig.defaultSize * 30,
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // Add background color to make the border radius visible
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(IMAGE_CONST.LOGO),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
