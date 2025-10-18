import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Media.search,
            width: 20.w,
            height: 20.h,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(color: ColorManger.gray),
                isDense: true,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          SvgPicture.asset(
            Media.setting,
            width: 20.w,
            height: 20.h,
            colorFilter: const ColorFilter.mode(
              ColorManger.black,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
