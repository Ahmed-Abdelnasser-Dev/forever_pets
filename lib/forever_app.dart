import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_pets/core/routes/app_router.dart';
import 'package:forever_pets/core/routes/routes.dart';

class ForeverApp extends StatelessWidget {
  final bool isFirstTime;

  const ForeverApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Forever Pets',
        debugShowCheckedModeBanner: false,

        initialRoute: isFirstTime ? Routes.boarding : Routes.home,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
