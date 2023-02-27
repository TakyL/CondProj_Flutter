import 'package:flutter/material.dart';
import 'package:flutter_calendrier/widgets/Widget_FloatingActionBtn.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{
  testWidgets('MyFloatingActionButton should render with provided Icon',
          (WidgetTester tester) async {
        final iconData = Icons.add;
        final key = UniqueKey();
        final onPressed = () {};
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MyFloatingActionButton(
                icon: iconData,
                key: key,
                onPressed: onPressed,
              ),
            ),
          ),
        );

        final floatingActionButton =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));

        expect(floatingActionButton.child, iconData);
      });

  testWidgets('MyFloatingActionButton should render with provided key',
          (WidgetTester tester) async {
        final icon = (Icons.add);
        final key = UniqueKey();
        final onPressed = () {};
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MyFloatingActionButton(
                icon: icon,
                key: key,
                onPressed: onPressed,
              ),
            ),
          ),
        );

        final floatingActionButton =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));

        expect(floatingActionButton.key, key);
      });

  testWidgets('MyFloatingActionButton should call onPressed callback when pressed',
          (WidgetTester tester) async {
        var onPressedCalled = false;
        final icon = (Icons.add);
        final key = UniqueKey();
        final onPressed = () {
          onPressedCalled = true;
        };
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MyFloatingActionButton(
                icon: icon,
                key: key,
                onPressed: onPressed,
              ),
            ),
          ),
        );

        final floatingActionButton =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));

        await tester.tap(find.byWidget(floatingActionButton));
        expect(onPressedCalled, true);
      });
}