import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/main.dart';

void main() {
  testWidgets('FáilteGo app loads correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Let everything settle (important for navigation/setup)
    await tester.pumpAndSettle();

    // Check that MaterialApp exists
    expect(find.byType(MaterialApp), findsOneWidget);

    // Change this to match your UI text if needed
    expect(find.byType(Scaffold), findsWidgets);
  });
}