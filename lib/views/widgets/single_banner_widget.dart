import 'package:flutter/material.dart';
import '../../models/banner.dart';

class SingleBannerWidget extends StatelessWidget {
  final BannerContent banner;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  SingleBannerWidget({
    required this.banner,
    this.height,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0), // Default padding if not provided
      child: Container(
        height: height ??
            MediaQuery.of(context).size.height /
                3, // Default height if not provided
        decoration: BoxDecoration(
          borderRadius: borderRadius ??
              BorderRadius.circular(0), // Default border radius if not provided
          image: DecorationImage(
            image: NetworkImage(banner.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            banner.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(blurRadius: 10, color: Colors.black)],
            ),
          ),
        ),
      ),
    );
  }
}
