import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/banner.dart';
import 'single_banner_widget.dart';

class BannerSliderWidget extends StatelessWidget {
  final List<BannerModel> banners;

  BannerSliderWidget({required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        // Assuming each BannerModel has only one BannerContent item
        final bannerContent = banners[index].contents.isNotEmpty
            ? banners[index].contents[0]
            : null; // Show null if contents are empty

        if (bannerContent == null) {
          return Center(child: Text('No banner data available'));
        }

        return SingleBannerWidget(banner: bannerContent);
      },
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0, // Make sure the entire banner is visible
      ),
    );
  }
}
