import 'package:flutter/material.dart';
import 'package:machine_test/models/single_banner.dart';
import '../../models/banner.dart';

class SingleBannerWidget extends StatelessWidget {
  final BannerContent banner;

  SingleBannerWidget({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(banner.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          banner.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(blurRadius: 10, color: Colors.black)],
          ),
        ),
      ),
    );
  }
}
