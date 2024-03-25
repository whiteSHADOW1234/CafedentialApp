import 'package:flutter_test/flutter_test.dart';
import 'package:cafedential/AuthenticateScreen/login_screen.dart';
import 'package:cafedential/AuthenticateScreen/register_screen.dart';
import 'package:cafedential/AuthenticateScreen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text('LogIn'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    // Add more expectations based on your UI
  });

  testWidgets('Register screen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Register()));
    expect(find.text('Register'), findsNWidgets(2));
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('Welcome Screen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Welcome()));
    expect(find.text('Cafedential'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register with Email'), findsOneWidget);
    // Add more expectations based on your UI
  });
}
