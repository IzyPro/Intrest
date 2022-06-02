import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intrests/views/landing.dart';

import 'widget_test.dart';

void main() {
  testWidgets('Landing Screen Widget Test', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: Landing()));
    final messageFinder = find.text(
        'Be faithful to your own taste, because\nnothing you really like is ever out of style');
    final iconFinder =
        find.widgetWithIcon(GestureDetector, Icons.arrow_right_alt_sharp);
    final headerFinder = find.text("Let's\nfind your\ninterests");

    expect(messageFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(headerFinder, findsOneWidget);
  });
}
