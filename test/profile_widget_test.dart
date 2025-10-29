import 'package:flutter_test/flutter_test.dart';
import 'package:worksheet_2/main.dart';

void main() {
  testWidgets('Profile page loads and shows header and profile info', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    // App bar title
    expect(find.text('Kirk Gamo'), findsOneWidget);

    // Bottom navigation contains Profile label
    expect(find.text('Profile'), findsOneWidget);

    // Profile page shows name and an email row
    expect(find.text('Kirk Gamo'), findsOneWidget);
    expect(find.text('EMAIL'), findsOneWidget);
  });
}
