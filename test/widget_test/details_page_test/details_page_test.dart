import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/core/widgets/custom_app_bar.dart';
import 'package:forever_pets/features/details/presentation/pages/details_page.dart';
import 'package:forever_pets/features/details/presentation/widgets/info_box.dart';

Future<void> pumpWithScreenUtil(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(home: child),
      child: widget,
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('DetailsPage Widget Tests', () {
    const heroTag = 'test-hero-tag';

    testWidgets('renders DetailsPage without errors', (
      WidgetTester tester,
    ) async {
      await pumpWithScreenUtil(tester, const DetailsPage(heroTag: heroTag));

      // Verify CustomAppBar exists
      expect(find.byType(CustomAppBar), findsOneWidget);

      // Verify Hero widget exists with the correct tag
      expect(find.byType(Hero), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Hero && widget.tag == heroTag,
        ),
        findsOneWidget,
      );

      // Verify title, location, and price are present
      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.text('New York'), findsOneWidget);
      expect(find.text('\$ 95'), findsOneWidget);

      // Verify InfoBox widgets
      expect(find.byType(InfoBox), findsNWidgets(3));
      expect(find.text('Female'), findsOneWidget);
      expect(find.text('2 Years'), findsOneWidget);
      expect(find.text('15 Kg'), findsOneWidget);

      // Verify About section
      expect(find.text('About'), findsOneWidget);

      // Verify description exists
      expect(
        find.textContaining('Tom is a playful and loyal Golden Retriever'),
        findsOneWidget,
      );
    });

    testWidgets('scrollable content works', (WidgetTester tester) async {
      await pumpWithScreenUtil(tester, const DetailsPage(heroTag: heroTag));

      final scrollable = find.byType(SingleChildScrollView);
      expect(scrollable, findsOneWidget);

      // Try scrolling
      await tester.drag(scrollable, const Offset(0, -200));
      await tester.pumpAndSettle();

      // Verify content is still visible after scrolling
      expect(find.text('About'), findsOneWidget);
    });
  });
}
