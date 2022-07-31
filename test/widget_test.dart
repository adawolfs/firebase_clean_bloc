import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_clean_bloc/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.text('Firebase Clean Bloc'), findsWidgets);
  });
}
