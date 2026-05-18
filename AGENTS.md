# AGENTS.md

## Repo reality (verified)
- Single-package Flutter app (no melos/workspace, no CI workflows in `.github/workflows`).
- Main app entrypoint is `lib/main.dart`.
- Dependency injection is GetX-based and starts from `MainInjector` (`lib/di/main_injector.dart`).

## Commands to use
- Install deps: `flutter pub get`
- Static checks: `flutter analyze`
- Run tests (single file): `flutter test test/widget_test.dart`

## Platform quirks

### iOS
- App uses UISceneDelegate lifecycle (`ios/Runner/SceneDelegate.swift`) with `FlutterImplicitEngineDelegate` in `AppDelegate.swift`.
- `google_maps_flutter_ios` does not support arm64 for iOS 26+ simulators (upstream plugin limitation).

### macOS
- macOS support added via `flutter create --platforms=macos` (see `macos/` directory).
- `google_maps_flutter` and `youtube_player_flutter` do not support macOS. The widgets `LaunchpadMap` and `YoutubePlayerWidget` check `Platform.isMacOS` at runtime and show a placeholder instead of crashing.
- `flutter_inappwebview_macos` is available (transitive dependency) if embedded web views are needed for desktop.
- Build: `flutter build macos --debug`, run: `flutter run -d macos`.

## Architecture wiring you must keep in sync
- Routing is centralized in:
  - `lib/presentation/routes/spacex_routes.dart` (route names)
  - `lib/presentation/routes/spacex_scenes.dart` (`GetPage` registration + bindings)
- DI is split between:
  - global services/repos/interactors: `lib/di/main_injector.dart`
  - feature/viewmodel bindings: `lib/di/**/**/*injector.dart`
- Adding a new scene usually requires updates in **all three** places: route constants, scene registration, and injector binding.

## Data/integration constraints
- SpaceX API base URL is hardcoded in datasource services under `lib/data/datasources/spacex_service/*_service.dart` (`https://api.spacexdata.com/v4`). No env-based API switching exists.
- Localization is required at app root via `EasyLocalization` in `main.dart`; translation assets are loaded from `assets/translations` (declared in `pubspec.yaml`).

## Repo-specific conventions easy to miss
- Package imports use exact-cased `package:SpaceXFlutterOdyssey/...` everywhere; keep this naming consistent when creating new files/imports.
- Existing `test/widget_test.dart` is still the default Flutter counter smoke test and is not aligned with current app behavior.
