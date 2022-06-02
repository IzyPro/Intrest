import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intrests/viewmodels/home_vm.dart';
import 'package:intrests/views/home.dart';
import 'package:intrests/views/widgets/button.dart';
import 'package:intrests/views/widgets/custom_field.dart';

import 'widget_test.dart';

void main() {
  group('HomeViewModel Group Test', () {
    final viewModel = new HomeViewModel();
    final allInterests = viewModel.getAllInterests();
    test('Fetch All Interests', () {
      expect(allInterests.length, viewModel.getAllInterests().length);
      expect(viewModel.selected, []);
      expect(viewModel.unSelected.length, allInterests.length);
    });

    test('Select Interest', () {
      viewModel.select(allInterests.first);
      expect(viewModel.selected.isNotEmpty, true);
      expect(viewModel.selected.length, 1);
      expect(viewModel.unSelected.length, allInterests.length - 1);
    });

    test('Unselect Interest', () {
      viewModel.unSelect(allInterests.first);
      expect(viewModel.selected.isNotEmpty, false);
      expect(viewModel.selected.length, 0);
    });

    testWidgets('Widgets Test', (tester) async {
      await tester.pumpWidget(createProviderWidgetForTesting(child: Home()));
      final messageFinder = find.widgetWithText(Column,
          'Select a minimum of 3 interests and a maximum of 7 interests.');
      final headerFinder = find.text("Interests");

      expect(messageFinder, findsOneWidget);
      expect(headerFinder, findsOneWidget);
      expect(find.byType(CustomField), findsOneWidget);
    });

    testWidgets('Disabled Button Test', (tester) async {
      await tester.pumpWidget(createProviderWidgetForTesting(child: Home()));
      final button = find.byType(CustomButton);

      expect(tester.widget<CustomButton>(button).disabled, true);
    });
  });
}
