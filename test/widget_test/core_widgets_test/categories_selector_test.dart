import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/core/widgets/categories_selector.dart';

void main() {
  // Helper to wrap widget with ScreenUtilInit
  Future<void> pumpWithScreenUtil(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(home: Scaffold(body: child)),
        child: widget,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('CategoriesSelector shows all categories', (
    WidgetTester tester,
  ) async {
    await pumpWithScreenUtil(tester, const CategoriesSelector());

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Cats'), findsOneWidget);
    expect(find.text('Dogs'), findsOneWidget);
  });

  testWidgets('Selecting category updates UI', (WidgetTester tester) async {
    await pumpWithScreenUtil(tester, const CategoriesSelector());

    final first = find.text('All');
    final second = find.text('Cats');

    expect(first, findsOneWidget);

    await tester.tap(second);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
