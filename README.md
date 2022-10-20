
# new_version_check

Flutter plugin to get the current version of the app locally and in stores. And nothing superfluous

## Features

    1) Get a version in the AppStore
    2) Get a version in the Playmarket
    3) Get the current app version

## Getting started

```dart
import 'package:new_version_check/new_version_check.dart';
```

## Usage

```dart
var newVersionPlus = NewVersionCheck(iOSAppStoreCountry: 'ru');
var status = await newVersionPlus.getVersionStatus();

String? appStoreLink = status?.appStoreLink;
String? localVersion = status?.localVersion;
String? storeVersion = status?.storeVersion;
bool? canUpdate = status?.canUpdate;
```

## Additional information

For this package to work, you must have your apps published to the Appstore or Playmarket