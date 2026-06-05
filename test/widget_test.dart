import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; 

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Initially shows 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the + button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Now shows 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget); 
  });
}
