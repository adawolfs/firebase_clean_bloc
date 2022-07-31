import 'package:firebase_clean_bloc/user/bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserWidget extends StatelessWidget {
  const AddUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return AddUserElevatedButton();
      },
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AddUserDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback callback;
  const AddUserDialog(
      {Key? key, required this.callback, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Ingresa el nombre del usuario'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OverflowBar(
            spacing: 8.0,
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  callback();
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddUserElevatedButton extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  AddUserElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext dialogContext) => AddUserDialog(
          controller: _controller,
          callback: () {
            BlocProvider.of<UserBloc>(context)
                .add(UserCreate(_controller.text));
            _controller.clear();
          },
        ),
      ),
      child: const Text("Agregar Usuario"),
    );
  }
}
