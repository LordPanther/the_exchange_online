import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../widgets/others/shimmer_image.dart';

class CenterBanner extends StatefulWidget {
  final List<BannerModel>? banners;

  const CenterBanner({super.key, required this.banners});
  @override
  // ignore: library_private_types_in_public_api
  _CenterBannerState createState() => _CenterBannerState();
}

class _CenterBannerState extends State<CenterBanner> {
  List<BannerModel?> get banners => widget.banners!;
  final double aspectRatioBanner = 2 / 1;

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: SizeConfig.defaultSize * 0.5),
        _buildSlider(),
        SizedBox(height: SizeConfig.defaultSize * 3),
        _buildIndicators(),
        SizedBox(height: SizeConfig.defaultSize * 3),
      ],
    );
  }

  _buildSlider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // Maintain aspect ratio for the banner
        return AspectRatio(
          aspectRatio: aspectRatioBanner,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: double.infinity, // Let AspectRatio control height
              pageViewKey: const PageStorageKey("home_banner"),
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.linearToEaseOut,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() => currentIndex = index);
              },
            ),
            items: banners.map((banner) {
              return SizedBox(
                width: width,
                child: ShimmerImage(
                  aspectRatio: aspectRatioBanner,
                  imageUrl: banner!.imageUrl!,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.defaultSize * 0.5,
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(banners.length, (index) {
          return _buildIndicatorNormal(index == currentIndex);
        }),
      ],
    );
  }

  _buildIndicatorNormal(bool isSelected) {
    return AnimatedContainer(
      duration: mAnimationDuration,
      height: SizeConfig.defaultSize,
      width: SizeConfig.defaultSize,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.3),
      decoration: BoxDecoration(
        color: isSelected
            ? COLOR_CONST.primaryColor
            : COLOR_CONST.greyColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 0.5),
      ),
    );
  }
}
