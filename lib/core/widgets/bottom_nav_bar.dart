import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forever_pets/core/constants/media_constants.dart';
import 'package:forever_pets/core/theme/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _icons = [
    {'default': Media.home, 'filled': Media.homeFilled},
    {'default': Media.heart, 'filled': Media.heartFilled},
    {'default': Media.chat, 'filled': Media.chatFilled},
    {'default': Media.profile, 'filled': Media.profileFilled},
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorManger.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 4.r,
            offset: Offset(0, -4.h),
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_icons.length, (index) {
          final bool isSelected = _selectedIndex == index;
          final String iconPath = isSelected
              ? _icons[index]['filled']!
              : _icons[index]['default']!;

          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                iconPath,
                width: 30.w,
                height: 30.h,
                colorFilter: ColorFilter.mode(
                  isSelected ? ColorManger.primaryColor : ColorManger.gray,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
