import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_pets/core/theme/colors.dart';
import 'package:forever_pets/core/theme/text.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({super.key});

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  final List<String> categories = [
    'All',
    'Cats',
    'Dogs',
    'Birds',
    'Fish',
    'Reptiles',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorManger.primaryColor
                    : ColorManger.inactiveSelectorColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextManager.poppins14SemiBold.copyWith(
                    color: isSelected
                        ? ColorManger.white
                        : ColorManger.primaryColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
