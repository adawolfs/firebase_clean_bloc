import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UserCreate>((event, emit) {
      emit(UserCreated(users: [...state.users, User(name: event.name)]));
    });
  }
}

@immutable
abstract class UserState {
  final List<User> users;
  const UserState({required this.users});
}

abstract class UserEvent {}

class UserInitial extends UserState {
  UserInitial() : super(users: []);
}

class UserCreated extends UserState {
  const UserCreated({required super.users});
}

class UserCreate extends UserEvent {
  final String name;
  UserCreate(this.name);
}
