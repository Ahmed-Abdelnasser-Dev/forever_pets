import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/spacing.dart';
import 'package:forever_pets/core/theme/text.dart';
import 'package:forever_pets/core/widgets/custom_app_bar.dart';
import 'package:forever_pets/features/details/presentation/widgets/info_box.dart';

class DetailsPage extends StatelessWidget {
  final String heroTag; // receive heroTag from AnimalCard

  const DetailsPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          //? Background image with Hero
          Hero(
            tag: heroTag,
            child: Container(
              height: 375.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManger.cardColor,
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                  image: AssetImage(Media.boarding),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //? Content below the image
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 375.h + 16.h,
              left: Spacing.appHorizontalMargin,
              right: Spacing.appHorizontalMargin,
              bottom: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //? title + location + price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? title
                        Text(
                          'Golden Retriever',
                          style: TextManager.poppins24Bold.copyWith(
                            color: ColorManger.black,
                          ),
                        ),
                        SizedBox(height: 4.h),

                        //? location
                        Row(
                          children: [
                            SvgPicture.asset(
                              Media.location,
                              width: 22.w,
                              height: 22.h,
                              colorFilter: const ColorFilter.mode(
                                ColorManger.secondaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'New York',
                              style: TextManager.poppins18Regular.copyWith(
                                color: ColorManger.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //? price
                    Text(
                      '\$ 95',
                      style: TextManager.poppins26Bold.copyWith(
                        color: ColorManger.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Spacing.verticalSpace),

                //? Info Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoBox(title: 'Female', subtitle: 'Gender'),
                    SizedBox(width: Spacing.horizontalSpace),
                    InfoBox(title: '2 Years', subtitle: 'Age'),
                    SizedBox(width: Spacing.horizontalSpace),
                    InfoBox(title: '15 Kg', subtitle: 'Weight'),
                  ],
                ),
                SizedBox(height: Spacing.verticalSpace),

                //? About Section
                Text(
                  'About',
                  style: TextManager.poppins24Bold.copyWith(
                    color: ColorManger.black,
                  ),
                ),
                SizedBox(height: 14.h),

                //? Description
                Text(
                  'Tom is a playful and loyal Golden Retriever who loves being around people. He’s 1 year old, full of energy, and always ready for a game of fetch. Tom enjoys morning walks, belly rubs, and taking long naps after playtime. He’s gentle with kids, gets along well with other pets, and makes the perfect family companion.',
                  style: TextManager.poppins14Regular.copyWith(
                    color: ColorManger.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
