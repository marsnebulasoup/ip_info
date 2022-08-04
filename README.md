# IP Info

## About
A small app designed to give you information about your IP address.

See here for [releases](https://github.com/marsnebulasoup/ip_info/releases).

## Screenshots
![Screenshot](./screenshot.jpg)


## Building from scratch
Run `flutter pub get` in the main directory and also in each package directory.

In the `ip_info` package `packages/ip_info`, run 
```
flutter packages pub run build_runner build
```
To test the IP repo package:
```
flutter test --coverage && genhtml coverage/lcov.info -o coverage && start coverage/index.html
```