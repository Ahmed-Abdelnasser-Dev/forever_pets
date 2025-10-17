import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_pets/core/routes/routes.dart';
import 'package:forever_pets/features/boarding/presentation/pages/boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Widget createBoardingPage({RouteFactory? onGenerateRoute}) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        home: const BoardingPage(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  group('BoardingPage Widget Tests', () {
    testWidgets('renders main UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(createBoardingPage());
      await tester.pumpAndSettle();

      // Verify main UI content
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Find Your Best\nCompanion With Us'), findsOneWidget);
      expect(
        find.text(
          'Join & discover the best suitable pets as per your preferences in your location',
        ),
        findsOneWidget,
      );
      expect(find.text('Get Started'), findsOneWidget);

      // Since you’re using SvgPicture, not Icon
      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('tapping Get Started saves flag & navigates to root route', (
      WidgetTester tester,
    ) async {
      // Mock SharedPreferences
      SharedPreferences.setMockInitialValues({});

      bool navigated = false;

      await tester.pumpWidget(
        createBoardingPage(
          onGenerateRoute: (settings) {
            if (settings.name == Routes.home) {
              navigated = true;
            }
            return MaterialPageRoute(
              builder: (_) => const Scaffold(body: Text('Mock Page')),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      // Tap "Get Started"
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Verify SharedPreferences flag is set
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isFirstTime'), isFalse);

      // Verify navigation
      expect(navigated, isTrue);
    });
  });
}
