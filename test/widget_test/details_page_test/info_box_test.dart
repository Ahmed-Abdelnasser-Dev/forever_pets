import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/features/details/presentation/widgets/info_box.dart';
import 'package:forever_pets/core/theme/colors.dart';

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
  group('InfoBox Widget Tests', () {
    const titleText = 'Female';
    const subtitleText = 'Gender';

    testWidgets('renders InfoBox with title and subtitle', (tester) async {
      await pumpWithScreenUtil(
        tester,
        const Scaffold(
          body: InfoBox(title: titleText, subtitle: subtitleText),
        ),
      );

      expect(find.text(titleText), findsOneWidget);
      expect(find.text(subtitleText), findsOneWidget);

      // Verify Column inside Container
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      final columnFinder = find.descendant(
        of: containerFinder,
        matching: find.byType(Column),
      );
      expect(columnFinder, findsOneWidget);
    });

    testWidgets('InfoBox has proper padding and decoration', (tester) async {
      await pumpWithScreenUtil(
        tester,
        const Scaffold(
          body: InfoBox(title: titleText, subtitle: subtitleText),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      // Use closeTo for ScreenUtil-scaled values
      final borderRadius = decoration.borderRadius as BorderRadius;
      expect(borderRadius.topLeft.x, closeTo(10.r, 0.1));

      final padding = container.padding as EdgeInsets;
      expect(padding.top, closeTo(12.h, 0.1));
      expect(padding.left, closeTo(12.w, 0.1));

      // Verify background color
      expect(decoration.color, ColorManger.cardColor);
    });
  });
}
