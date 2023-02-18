import 'package:firebase_clean_bloc/user/bloc/user.dart';
import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:firebase_clean_bloc/user/ui/screens/user_list.dart';
import 'package:firebase_clean_bloc/user/ui/widgets/add_user.dart';
import 'package:firebase_clean_bloc/user/ui/widgets/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  userWidgets();
}

void userWidgets() {
  // Elementos utilizados
  String testUserName = "Test User";
  List<User> users = [User(name: testUserName), User(name: testUserName)];
  Finder buttonFinder = find.text('Agregar Usuario');
  Finder messageTitleFinder = find.text("Ingresa el nombre del usuario");
  Finder messageOKButtonFinder = find.text("OK");
  Finder testUserFinder = find.text(testUserName);

  testWidgets('Test User List', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UserListView(
            width: 50,
            height: 50,
            users: users,
          ),
        ),
      ),
    );
    expect(find.text(testUserName), findsOneWidget);
  });

  testWidgets('Test Add User Dialog', (tester) async {
    final TextEditingController controller = TextEditingController();
    int tapCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddUserDialog(
            controller: controller,
            callback: () {
              tapCount++;
            },
          ),
        ),
      ),
    );
    // Messagebox is open?
    // Message should be shown.
    // Testfield should be loaded.
    expect(messageTitleFinder, findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    // Enter text and check controller binding.
    await tester.enterText(find.byType(TextField), testUserName);
    await tester.tap(messageOKButtonFinder);
    await tester.pump();
    expect(controller.text, testUserName);
    expect(tapCount, 1);
  });
  testWidgets('Test Add User Elevated Button', (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => UserBloc(),
      child: const MaterialApp(
        home: Scaffold(
          body: AddUserWidget(),
        ),
      ),
    ));
    // Button exists, lets tap it!
    expect(buttonFinder, findsOneWidget);
    await tester.tap(buttonFinder);
    await tester.pump();
    // Messagebox is open?
    // Message should be shown.
    // Testfield should be loaded.
    expect(messageTitleFinder, findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    // Enter text, tap OK and verify the message is closed.
    await tester.enterText(find.byType(TextField), testUserName);
    await tester.tap(messageOKButtonFinder);
    await tester.pump();
    expect(messageOKButtonFinder, findsNothing);
  });

  testWidgets('Add User Flow', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UserListScreen(),
        ),
      ),
    );
    // Widgets are loaded
    expect(find.byType(UserListView), findsOneWidget);
    expect(find.byType(AddUserWidget), findsOneWidget);
    // Start flow
    expect(testUserFinder, findsNothing);
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(messageTitleFinder, findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    await tester.pump();
    await tester.enterText(find.byType(TextField), testUserName);
    await tester.tap(messageOKButtonFinder);
    await tester.pump();
    expect(testUserFinder, findsOneWidget);
  });
}
