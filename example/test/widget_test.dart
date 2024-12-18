// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_shake/flutter_shake.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Shake detection test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the DemoPage is displayed.
    expect(find.byType(DemoPage), findsOneWidget);

    // Simulate a shake event.
    final ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        // This is where you would verify the shake event.
        // For example, you could check if a SnackBar is shown.
        expect(find.text('Shake!'), findsOneWidget);
      },
    );

    // Trigger the shake event.
    detector.onPhoneShake();

    // Clean up the detector.
    detector.stopListening();
  });
}
