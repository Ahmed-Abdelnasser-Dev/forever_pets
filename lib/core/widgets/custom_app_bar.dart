import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onLikePressed;

  const CustomAppBar({super.key, this.onBackPressed, this.onLikePressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: onBackPressed ?? () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            Media.back,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              ColorManger.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onLikePressed,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              Media.heart,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                ColorManger.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
