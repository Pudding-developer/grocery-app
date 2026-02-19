import 'package:flutter_test/flutter_test.dart';

import 'package:groceryapp/main.dart';

void main() {
  testWidgets('App renders HomeScreen with welcome message', (WidgetTester tester) async {
    await tester.pumpWidget(const GroceryApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Grocery App!'), findsOneWidget);
    expect(find.text('Browse Products'), findsOneWidget);
  });
}
