import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/core/widgets/custom_app_bar.dart';

Future<void> pumpWithScreenUtil(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Scaffold(body: child),
        ),
      ),
      child: widget,
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('CustomAppBar Widget Tests', () {
    testWidgets('renders AppBar with back and like buttons', (
      WidgetTester tester,
    ) async {
      await pumpWithScreenUtil(tester, const CustomAppBar());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key('back_button')), findsOneWidget);
      expect(find.byKey(const Key('like_button')), findsOneWidget);
    });

    testWidgets('onBackPressed callback is called when back button tapped', (
      WidgetTester tester,
    ) async {
      bool backPressed = false;

      await pumpWithScreenUtil(
        tester,
        CustomAppBar(onBackPressed: () => backPressed = true),
      );

      final backButton = find.byKey(const Key('back_button'));
      await tester.tap(backButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(backPressed, isTrue);
    });

    testWidgets('onLikePressed callback is called when like button tapped', (
      WidgetTester tester,
    ) async {
      bool likePressed = false;

      await pumpWithScreenUtil(
        tester,
        CustomAppBar(onLikePressed: () => likePressed = true),
      );

      final likeButton = find.byKey(const Key('like_button'));
      await tester.tap(likeButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(likePressed, isTrue);
    });

    testWidgets('preferredSize is correct', (WidgetTester tester) async {
      const appBar = CustomAppBar();
      expect(appBar.preferredSize.height, 56.h);
    });
  });
}
