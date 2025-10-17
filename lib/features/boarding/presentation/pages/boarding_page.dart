import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/routes/router_helper_extension.dart';
import 'package:forever_pets/core/routes/routes.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/spacing.dart';
import 'package:forever_pets/core/theme/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.appHorizontalMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //? Cat and Dog Image
            Image.asset(
              Media.boarding,
              height: 305.h,
              width: 442.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 70.h),

            //? Title Text
            Text(
              'Find Your Best\nCompanion With Us',
              textAlign: TextAlign.center,
              style: TextManager.poppins32Bold.copyWith(
                color: ColorManger.black,
              ),
            ),
            SizedBox(height: 10.h),

            //? Body Text
            Text(
              'Join & discover the best suitable pets as per your preferences in your location',
              textAlign: TextAlign.center,
              style: TextManager.poppins16Regular.copyWith(
                color: ColorManger.gray,
              ),
            ),
            SizedBox(height: 60.h),

            //? Get Started Button
            FilledButton.icon(
              onPressed: () async {
                final sharedPrefs = await SharedPreferences.getInstance();

                sharedPrefs.setBool('isFirstTime', false);
                context.pushReplacementNamed(Routes.home);
              },

              //? Icon
              icon: SvgPicture.asset(
                Media.pow,
                height: 24.h,
                width: 24.w,
                colorFilter: const ColorFilter.mode(
                  ColorManger.white,
                  BlendMode.srcIn,
                ),
              ),

              //? Text
              label: Text(
                'Get Started',
                style: TextManager.poppins18Medium.copyWith(
                  color: ColorManger.white,
                ),
              ),

              //? Button Style
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  ColorManger.primaryColor,
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 72.w, vertical: 16.h),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
