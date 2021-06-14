# Nubank Marketplace

A Flutter app that allows users to buy products with their cash on account

## How to run?

- Install Flutter version 2.2.
- Clone the project.
- Run the project by entering your token via dart args.
	> flutter run --dart-define=URL_TOKEN=YOUR_TOKEN_HERE

## Screenshots


<p align="center">
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen1.png" width="30%" height="30%"/>
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen2.png" width="30%" height="30%"/>
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen3.png" width="30%" height="30%" />
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen4.png" width="30%" height="30%" />
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen5.png" width="30%" height="30%" />
<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/screen6.png" width="30%" height="30%" />


>Works seamlessly on Android devices, Web Browsers and Desktop

## Architecture

<img src="https://github.com/DoisLucas/nubank-marketplace/blob/main/assets/screenshots/diagram.png" width="60%" height="60%"/>


## External Packages

### [get](https://pub.dev/packages/mobx)

Is a popular state management library for Dart and Flutter apps. It has also been recognized as a [Flutter Favorite package](https://flutter.dev/docs/development/packages-and-plugins/favorites).
VM, since I developed for Android before Flutter, this approach remembers me much with Android Jetpack components as Live Datas, ViewModel and so on.

### [graphql](https://pub.dev/packages/graphql)

graphql/client.dart is a GraphQL client for dart modeled on the apollo client, and is currently the most popular GraphQL client for dart. It is co-developed alongside graphql_flutter on github, where you can find more in-depth examples.

### [intl](https://pub.dev/packages/intl)

Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.

### [cached_network_image](https://pub.dev/packages/cached_network_image)

A flutter library to show images from the internet and keep them in the cache directory.

### [another_flushbar](https://pub.dev/packages/another_flushbar)

A flexible widget for user notification. Customize your text, button, duration, animations and much more. For Android devs, it is made to replace Snackbars and Toasts.

