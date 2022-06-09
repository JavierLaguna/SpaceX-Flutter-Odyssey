# 📱 SpaceX Flutter Odyssey
## 📝 Description

Little iOS and Android client for consume [SpaceX](https://api.spacexdata.com/v4) API

> Project used for learn Dart and Flutter

## 📷 Screenshots

![Splash](/.readme_resources/splash.png)

![Upcoming Launches](/.readme_resources/upcoming_launches.png)
![Launches Grid](/.readme_resources/all_launches_grid.png)
![Launches List](/.readme_resources/all_launches_list.png)

![Launch Detail](/.readme_resources/launch_detail.png)
![Launch Location](/.readme_resources/launch_location.png)

![Settings](/.readme_resources/settings.png)

## 🚩 Instructions

1. Get dependencies with `flutter pub get`

## 🚧 Application Architecture

[Flutter](https://flutter.dev/) app based on ([Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) + [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)) as main architecture.

[GetX](https://pub.dev/packages/get) for reactive ViewModels, dependency injection , manage themes and navigations.

[http](https://pub.dev/packages/http) as networking layer.

[easy_localization](https://pub.dev/packages/easy_localization) for intl.

[GitFlow](https://datasift.github.io/gitflow/IntroducingGitFlow.html) as Git methodology.

## ✅ App Features

##### Upcoming Launches

- List next upcoming launches on a carousel
##### Launches

- List all launches on a grid or on a list
- Pull to refresh launches list

##### Launch detail

- Show launch details
- Launch video on Youtube frame
- Show Launchpad details and location on a Google Map

##### Settings

- Get app theme bases on device mode and modify from app settings

## 🛠 Work in progress


## 🔮 Next steps / features

- Search launch by name

## 💻 Author

> Javier Laguna
