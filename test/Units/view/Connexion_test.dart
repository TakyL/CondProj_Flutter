import 'package:flutter_calendrier/view/Connexion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ConnexionApp should render RootPage', (WidgetTester tester) async {
    await tester.pumpWidget(const ConnexionApp());
    expect(find.byType(RootPage), findsOneWidget);
  });
}
