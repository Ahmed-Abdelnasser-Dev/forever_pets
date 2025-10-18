import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/text.dart';

class AnimalCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String gender;
  final String age;
  final String distance;
  final VoidCallback onTap;
  final String heroTag;

  const AnimalCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.onTap,
    required this.heroTag,
  });

  @override
  State<AnimalCard> createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: ColorManger.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4.r,
              offset: Offset(0, .5.h),
            ),
          ],
        ),
        child: Row(
          children: [
            //? Image + Hero
            Hero(
              tag: widget.heroTag,
              child: Container(
                height: 112.h,
                width: 112.w,
                decoration: BoxDecoration(
                  color: ColorManger.cardColor,
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),

            //? Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextManager.poppins18Bold.copyWith(
                      color: ColorManger.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.gender,
                    style: TextManager.poppins14Regular.copyWith(
                      color: ColorManger.darkGray,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    widget.age,
                    style: TextManager.poppins14Regular.copyWith(
                      color: ColorManger.darkGray,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
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
                        widget.distance,
                        style: TextManager.poppins14Regular.copyWith(
                          color: ColorManger.darkGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //? Heart Button
            SizedBox(
              height: 112.h,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: SvgPicture.asset(
                      isLiked ? Media.heartFilled : Media.heart,
                      width: 24.w,
                      height: 24.h,
                      colorFilter: ColorFilter.mode(
                        ColorManger.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
