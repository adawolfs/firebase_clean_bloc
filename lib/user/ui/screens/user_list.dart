import 'package:firebase_clean_bloc/user/bloc/user.dart';
import 'package:firebase_clean_bloc/user/ui/widgets/add_user.dart';
import 'package:firebase_clean_bloc/user/ui/widgets/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Column(children: [
        ListUserWidget(width: width, height: height),
        const AddUserWidget(),
      ]),
    );
  }
}
