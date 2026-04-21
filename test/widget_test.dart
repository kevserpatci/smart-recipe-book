// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smart_recipe_book/main.dart';

void main() {
  testWidgets('main navigation and recipe list are displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SmartRecipeBookApp());

    expect(find.text('Smart Recipe Book'), findsOneWidget);
    expect(find.text('Featured Today'), findsOneWidget);
    expect(find.text('Categories'), findsWidgets);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Pancake'), findsOneWidget);
    expect(find.text('Spaghetti'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
