import 'package:firebase_clean_bloc/user/bloc/user.dart';
import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUserWidget extends StatelessWidget {
  final double width;
  const ListUserWidget({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return UserListView(width: width, users: state.users);
      },
    );
  }
}

class UserListView extends StatelessWidget {
  final double width;
  final List<User> users;
  const UserListView({Key? key, required this.width, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 2,
      width: width / 2,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].name),
          );
        },
      ),
    );
  }
}
