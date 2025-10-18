import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/routes/router_helper_extension.dart';
import 'package:forever_pets/core/routes/routes.dart';
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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                left: Spacing.appHorizontalMargin,
                right: Spacing.appHorizontalMargin,
                top: Spacing.appVerticalMargin,
                bottom: 0.h,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  //? Title + Notification
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
                  const CustomSearchBar(),
                  SizedBox(height: Spacing.verticalSpace),

                  //? Categories
                  Text(
                    'Categories',
                    style: TextManager.poppins20Bold.copyWith(
                      color: ColorManger.black,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  const CategoriesSelector(),
                ]),
              ),
            ),

            //? Spacer
            SliverToBoxAdapter(child: SizedBox(height: 14.h)),
            //? Animal Cards
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.appHorizontalMargin,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: AnimalCard(
                      imageUrl: 'assets/images/boarding.png',
                      name: 'Maggie $index',
                      gender: 'Female',
                      age: '2 years',
                      distance: '1 km',
                      heroTag: 'pet_image_$index',
                      onTap: () {
                        context.pushNamed(Routes.details);
                      },
                    ),
                  ),
                  childCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
