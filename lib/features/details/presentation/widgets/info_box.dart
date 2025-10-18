import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/text.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoBox({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorManger.cardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(
            title,
            style: TextManager.poppins18Bold.copyWith(color: ColorManger.black),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextManager.poppins14Regular.copyWith(
              color: ColorManger.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
