import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:firebase_clean_bloc/user/repository/firestore/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();
  UserBloc() : super(UserInitial()) {
    userRepository.getUsers().listen((event) {
      add(UsersLoaded(event));
    });
    on<UserEvent>((event, emit) {});
    on<UsersLoaded>((event, emit) => emit(UserListLoaded(users: event.users)));
    on<UserCreate>(
      (event, emit) => userRepository.createUser(User(name: event.name)),
    );
  }
}

@immutable
abstract class UserState {
  final List<User> users;
  const UserState({required this.users});
}

class UserInitial extends UserState {
  UserInitial() : super(users: []);
}

class UserCreated extends UserState {
  const UserCreated({required super.users});
}

class UserListLoaded extends UserState {
  const UserListLoaded({required super.users});
}

abstract class UserEvent {}

class UserCreate extends UserEvent {
  final String name;
  UserCreate(this.name);
}

class UsersLoaded extends UserEvent {
  final List<User> users;
  UsersLoaded(this.users);
}
