import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/banner.dart';
import 'single_banner_widget.dart';

class BannerSliderWidget extends StatefulWidget {
  final List<BannerModel> banners;

  BannerSliderWidget({required this.banners});

  @override
  _BannerSliderWidgetState createState() => _BannerSliderWidgetState();
}

class _BannerSliderWidgetState extends State<BannerSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Flatten the list of BannerContents from all BannerModels
    final bannerContents =
        widget.banners.expand((banner) => banner.contents).toList();

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: bannerContents.length,
          itemBuilder: (context, index, realIndex) {
            final bannerContent = bannerContents[index];
            return SingleBannerWidget(banner: bannerContent);
          },
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10.0, // Position the indicators slightly above the bottom
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(bannerContents.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: _currentIndex == index ? 12.0 : 8.0,
                height: _currentIndex == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? const Color.fromARGB(255, 33, 243, 166) : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
