import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating; // Rating value between 0 and 5
  final int totalStars; // Total number of stars to display

  RatingWidget({
    required this.rating,
    this.totalStars = 5,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= totalStars; i++) {
      stars.add(
        Icon(
          i <= rating ? Icons.star : Icons.star,
          color: i <= rating
              ? Colors.orange
              : Colors.grey, // Red for filled, Grey for unfilled
        ),
      );
    }

    return Row(
      children: stars,
    );
  }
}
