import 'package:flutter/material.dart';
import 'package:flutter_calendrier/widgets/Widget_FloatingActionBtn.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('MyFloatingActionButton', () {
    testWidgets('renders correctly with default values', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          floatingActionButton: MyFloatingActionButton(
            icon: Icons.add,
            onPressed: () {},
          ),
        ),
      ));

      expect(find.byType(MyFloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('renders correctly with custom key', (tester) async {
      final customKey = Key('test_key');

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          floatingActionButton: MyFloatingActionButton(
            icon: Icons.add,
            onPressed: () {},
            key: customKey,
          ),
        ),
      ));

      expect(find.byKey(customKey), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          floatingActionButton: MyFloatingActionButton(
            icon: Icons.add,
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ));

      await tester.tap(find.byType(MyFloatingActionButton));
      expect(wasPressed, isTrue);
    });



  });
}
