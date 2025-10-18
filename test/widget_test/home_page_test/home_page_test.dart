import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/features/home/presentation/pages/home_page.dart';

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
  group('HomePage Widget Tests', () {
    testWidgets('renders main components', (WidgetTester tester) async {
      await pumpWithScreenUtil(tester, const HomePage());

      // Title check
      expect(find.text('Find Your Forever Pet'), findsOneWidget);

      // Check ListViews by scroll direction
      final horizontalListView = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.horizontal,
      );
      final verticalListView = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.vertical,
      );

      expect(horizontalListView, findsOneWidget);
      expect(verticalListView, findsOneWidget);

      // Scrollable parent check
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('contains search bar and categories section', (
      WidgetTester tester,
    ) async {
      await pumpWithScreenUtil(tester, const HomePage());

      // Search bar
      expect(find.byType(TextField), findsOneWidget);

      // Categories section title
      expect(find.text('Categories'), findsOneWidget);

      // Optional: confirm horizontal category list exists
      final horizontalListView = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.horizontal,
      );
      expect(horizontalListView, findsOneWidget);
    });

    testWidgets('scrolls content properly', (WidgetTester tester) async {
      await pumpWithScreenUtil(tester, const HomePage());

      final scrollable = find.byType(SingleChildScrollView);
      expect(scrollable, findsOneWidget);

      // Try scrolling to ensure it’s not static
      await tester.drag(scrollable, const Offset(0, -200));
      await tester.pump();

      // No exceptions means scroll works fine
      expect(tester.takeException(), isNull);
    });
  });
}
