import 'package:firebase_clean_bloc/user/ui/screens/user_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FirebaseCleanBloc());

class FirebaseCleanBloc extends StatelessWidget {
  const FirebaseCleanBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Clean Bloc',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Clean Bloc'),
        ),
        body: Center(
          child: Container(
            child: const UserListScreen(),
          ),
        ),
      ),
    );
  }
}
