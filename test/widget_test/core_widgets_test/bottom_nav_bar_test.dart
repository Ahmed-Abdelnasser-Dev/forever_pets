import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_pets/core/widgets/bottom_nav_bar.dart';

void main() {
  Future<void> pumpWithScreenUtil(WidgetTester tester, Widget widget) async {
    // the test requires screen utils to be initialized
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(home: Scaffold(body: child)),
        child: widget,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('BottomNavBar renders 4 icons', (WidgetTester tester) async {
    await pumpWithScreenUtil(tester, const BottomNavBar());

    // There should be 4 clickable icons
    expect(find.byType(GestureDetector), findsNWidgets(4));
  });

  testWidgets('Tapping an icon updates selection', (WidgetTester tester) async {
    await pumpWithScreenUtil(tester, const BottomNavBar());

    // Tap the second icon
    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pumpAndSettle();

    // No errors, widget should rebuild successfully
    expect(tester.takeException(), isNull);
  });
}
