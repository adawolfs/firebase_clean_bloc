import 'package:firebase_clean_bloc/user/bloc/user.dart';
import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUserWidget extends StatelessWidget {
  final double width;
  final double height;
  const ListUserWidget({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return UserListView(width: width, height: height, users: state.users);
      },
    );
  }
}

class UserListView extends StatelessWidget {
  final double width;
  final double height;
  final List<User> users;
  const UserListView(
      {Key? key,
      required this.width,
      required this.users,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: height / 2,
          width: width / 2,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(users[index].name),
              );
            },
          ),
        ),
      ),
    );
  }
}
