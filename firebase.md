# Firebase Setup

The easiest way to implement firebase on flutter is use supported cli to automate the process.

## Install Firebase CLI
[Documentation](https://firebase.google.com/docs/cli#install-cli-mac-linux)
```
curl -sL https://firebase.tools | bash
firebase login
```

## Install flutterfire_cli
[Documetation](https://firebase.google.com/docs/flutter/setup?platform=web)
```
dart pub global activate flutterfire_cli
flutterfire configure
```