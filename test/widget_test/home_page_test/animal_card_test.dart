import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forever_pets/features/home/presentation/widgets/animal_card.dart';

void main() {
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

  testWidgets('AnimalCard displays data correctly', (
    WidgetTester tester,
  ) async {
    await pumpWithScreenUtil(
      tester,
      const AnimalCard(
        key: Key('AnimalCard'),
        imageUrl: 'assets/images/boarding.png',
        name: 'Maggie',
        gender: 'Female',
        age: '2 years',
        distance: '1.2 km',
      ),
    );

    expect(find.text('Maggie'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    expect(find.text('2 years'), findsOneWidget);
    expect(find.text('1.2 km'), findsOneWidget);
  });

  testWidgets('AnimalCard onTap callback is triggered', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await pumpWithScreenUtil(
      tester,
      AnimalCard(
        key: const Key('AnimalCard'),
        imageUrl: 'assets/images/boarding.png',
        name: 'Maggie',
        gender: 'Female',
        age: '2 years',
        distance: '1.2 km',
        onTap: () => tapped = true,
      ),
    );

    await tester.tap(find.byType(AnimalCard));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
