import 'package:cafedential/MainPageScreen/edit_coffee_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cafedential/MainPageScreen/add_coffee_page.dart';
import 'package:cafedential/MainPageScreen/card_page.dart';
import 'package:cafedential/MainPageScreen/main_methods/cloud_coffee_data.dart';

class MockCoffeeList extends Mock implements CoffeeList {}


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// Mock class for Function() notifyParent
class MockFunction extends Mock {
  void call();
}
void main() {
  testWidgets('AddCoffeeData widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddCoffeeData(notifyParent: () {}), // Pass a mock function here
    ));

    // Find the widgets you want to test
    expect(find.text('Add Coffee Data'), findsOneWidget);
    expect(find.text('Coffee Name'), findsOneWidget);

    // Tap the Save button and verify if it triggers the expected behavior
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that the notifyParent function is not called after tapping Save
    final mockFunction = MockFunction();
    await tester.pumpWidget(MaterialApp(
      home: AddCoffeeData(notifyParent: mockFunction),
    ));
    await tester.tap(find.text('Save'));
    verifyNever(mockFunction.call());
  });

  group('CardPage widget test', () {
    late MockCoffeeList mockCoffeeList;

    setUp(() {
      mockCoffeeList = MockCoffeeList();
      when(mockCoffeeList.coffeeName).thenReturn('Test Coffee');
      when(mockCoffeeList.coffeeRoast).thenReturn('Test Roast');
      when(mockCoffeeList.date).thenReturn('Test Date');
    });

    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CardPage(
          coffeeList: mockCoffeeList,
          doc_id: 'test_doc_id',
          notifyParent: () {},
        ),
      ));

      // Verify that AppBar title is correctly set
      expect(find.text('Test Coffee'), findsOneWidget);
      expect(find.text('Test Roast'), findsOneWidget);
      expect(find.text('Test Date'), findsOneWidget);
      expect(find.byKey(const Key('coffee_info_column')), findsOneWidget);

      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('Edit button navigates to EditCoffeeData', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CardPage(
          coffeeList: mockCoffeeList,
          doc_id: 'test_doc_id',
          notifyParent: () {},
        ),
      ));

      // Tap on the Edit IconButton
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      // Verify that navigation occurred to EditCoffeeData
      expect(find.byType(EditCoffeeData), findsOneWidget);
    });
  });

    testWidgets('EditCoffeeData renders correctly', (WidgetTester tester) async {
      // Build our widget
      await tester.pumpWidget(MaterialApp(home: EditCoffeeData(
        notifyParent: () {}, // Provide dummy function for notifyParent
        coffeeList: CoffeeList(), // Provide dummy CoffeeList object
        doc_id: '123', // Provide dummy document ID
      )));

      // Expect to find AppBar title
      expect(find.text('Edit Coffee Data'), findsOneWidget);
    });
}