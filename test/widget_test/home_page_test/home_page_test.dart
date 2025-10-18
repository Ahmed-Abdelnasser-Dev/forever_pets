import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/features/home/presentation/pages/home_page.dart';
import 'package:forever_pets/core/widgets/categories_selector.dart';
import 'package:forever_pets/features/home/presentation/widgets/custom_search_bar.dart';

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

      // CustomScrollView exists
      expect(find.byType(CustomScrollView), findsOneWidget);

      // Horizontal List inside CategoriesSelector
      final horizontalListView = find.descendant(
        of: find.byType(CategoriesSelector),
        matching: find.byType(ListView),
      );
      expect(horizontalListView, findsOneWidget);
    });

    testWidgets('contains search bar and categories section', (
      WidgetTester tester,
    ) async {
      await pumpWithScreenUtil(tester, const HomePage());

      // Search bar
      expect(find.byType(CustomSearchBar), findsOneWidget);

      // Categories section title
      expect(find.text('Categories'), findsOneWidget);

      // Horizontal categories list exists
      final horizontalListView = find.descendant(
        of: find.byType(CategoriesSelector),
        matching: find.byType(ListView),
      );
      expect(horizontalListView, findsOneWidget);
    });

    testWidgets('scrolls content properly', (WidgetTester tester) async {
      await pumpWithScreenUtil(tester, const HomePage());

      final scrollable = find.byType(CustomScrollView);
      expect(scrollable, findsOneWidget);

      // Drag to simulate scroll
      await tester.drag(scrollable, const Offset(0, -200));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}
