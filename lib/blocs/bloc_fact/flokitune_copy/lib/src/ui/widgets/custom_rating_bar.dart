import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingBar extends StatelessWidget {
  final int rating;
  const CustomRatingBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.72.w,
      height: 14.71.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (rating >= index + 1) {
            return Padding(
              padding: EdgeInsets.only(
                right: index != 0 && index != 2 ? 2.29.w : 0,
                left: index != 0 && index != 2 ? 2.29.w : 0,
              ),
              child: Icon(
                Icons.star,
                size: 14.71.w,
                color: const Color.fromRGBO(150, 154, 160, 1),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                right: index != 0 && index != 2 ? 2.29.w : 0,
                left: index != 0 && index != 2 ? 2.29.w : 0,
              ),
              child: Icon(
                Icons.star_border,
                size: 14.71.w,
                color: const Color.fromRGBO(150, 154, 160, 1),
              ),
            );
          }
        },
      ),
    );
  }
}
