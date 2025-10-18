import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/spacing.dart';
import 'package:forever_pets/core/theme/text.dart';
import 'package:forever_pets/core/widgets/bottom_nav_bar.dart';
import 'package:forever_pets/core/widgets/categories_selector.dart';
import 'package:forever_pets/features/home/presentation/widgets/animal_card.dart';
import 'package:forever_pets/features/home/presentation/widgets/custom_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.appHorizontalMargin,
              vertical: Spacing.appVerticalMargin,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //? Title and Notification Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find Your Forever Pet',
                      style: TextManager.poppins24Bold.copyWith(
                        color: ColorManger.black,
                      ),
                    ),
                    SvgPicture.asset(
                      Media.notification,
                      width: 24.w,
                      height: 24.h,
                      colorFilter: const ColorFilter.mode(
                        ColorManger.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Spacing.verticalSpace),

                //? Search Bar
                CustomSearchBar(),
                SizedBox(height: Spacing.verticalSpace),

                //? Categories
                Text(
                  'Categories',
                  style: TextManager.poppins20Bold.copyWith(
                    color: ColorManger.black,
                  ),
                ),

                SizedBox(height: 14.h),
                CategoriesSelector(),
                SizedBox(height: 14.h),

                //? Animal Cards
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemBuilder: (context, index) => const AnimalCard(
                    imageUrl: 'assets/images/boarding.png',
                    name: 'Maggie',
                    gender: 'Female',
                    age: '2 years',
                    distance: '1.2 km',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
