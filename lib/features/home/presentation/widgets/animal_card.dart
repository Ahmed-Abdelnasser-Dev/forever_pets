import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/text.dart';

class AnimalCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String gender;
  final String age;
  final String distance;
  final VoidCallback? onTap;

  const AnimalCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: ColorManger.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.05 * 255).round()),
              blurRadius: 4.r,
              offset: Offset(0, .5.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //? Image Section
            Container(
              height: 112.h,
              width: 112.w,
              decoration: BoxDecoration(
                color: ColorManger.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 16.w),

            //? Info Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //? Name
                  Text(
                    name,
                    style: TextManager.poppins18Bold.copyWith(
                      color: ColorManger.black,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  //? Gender
                  Text(
                    gender,
                    style: TextManager.poppins14Regular.copyWith(
                      color: ColorManger.darkGray,
                    ),
                  ),
                  SizedBox(height: 2.h),

                  //? Age
                  Text(
                    age,
                    style: TextManager.poppins14Regular.copyWith(
                      color: ColorManger.darkGray,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  //? Distance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Media.location,
                        width: 18.w,
                        height: 18.h,
                        colorFilter: const ColorFilter.mode(
                          ColorManger.secondaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        distance,
                        style: TextManager.poppins14Regular.copyWith(
                          color: ColorManger.darkGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),

            //? Like Button
            SizedBox(
              height: 112.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Media.heart,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      ColorManger.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
