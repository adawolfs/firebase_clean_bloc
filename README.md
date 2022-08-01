# Firebase Clean Bloc

This is a template project for Clean Architecture, Bloc, Firebase, Testing and Cross-platform on Flutter.

## About

### User
Each entity is designed to have loose coupling on every component to maximize simplicity.
```
./lib/user
├── bloc
│   └── user.dart
├── model
│   └── user.dart
├── repository
│   ├── firestore
│   │   └── user.dart
│   └── user.dart
└── ui
    ├── screens
    │   └── user_list.dart
    └── widgets
        ├── add_user.dart
        └── list_user.dart
```
### Tests

Review `test` directory

```
./test
├── user_tests.dart
└── widget_test.dart
```
