## Repository snapshot

- Small Flutter app (multi-platform) with entrypoint at `lib/main.dart`.
- Dependencies are declared in `pubspec.yaml` (uses `flutter` SDK and `flutter_lints`).
- Platform folders: `android/`, `ios/`, `windows/`, `linux/`, `macos/` contain native/build glue — avoid editing these unless implementing platform-specific features.

## High-level architecture & why

- Single-app Flutter UI (Material) — UI code lives under `lib/`.
- Platform folders hold generated or platform-specific code (gradle, Xcode project, CMake for desktop). App logic and UI belong in `lib/` so changes are cross-platform by default.

## Key files to inspect

- `lib/main.dart` — app entry point. Example: the app starts `MainApp` which builds a `MaterialApp` with a `Scaffold` and `Text('Hello World!')`.
- `pubspec.yaml` — dependency and asset declarations. After edits run `flutter pub get`.
- `android/` and `ios/` — native build configuration and signing. Use only when adding native plugins or changing platform behavior.

## Build / run / test commands (what actually works here)

- Fetch packages: `flutter pub get`
- Run on default device: `flutter run`
- Run on specific device: `flutter run -d <device-id>` (use `flutter devices` to list)
- Run desktop (Windows) from PowerShell: `flutter run -d windows`
- Build APK: `flutter build apk`
- Run unit/widget tests: `flutter test`
- Static analysis/lints: `flutter analyze` (or `dart analyze`)

## Project-specific conventions and patterns

- Keep UI and app logic inside `lib/` — platform folders are treated as infrastructure.
- Linting: `flutter_lints` is present; follow the rule set (prefer null-safety, small widget classes).
- Generated artifacts: do not edit `build/`, `ios/Runner/GeneratedPluginRegistrant.*`, or files under platform `ephemeral/` — these are regenerated.

## Integration points & external dependencies

- Plugins: add plugin coordinates to `pubspec.yaml` and run `flutter pub get`.
- Native integrations (Android/iOS): modify platform folders and follow platform build tooling (Gradle/Xcode). For CI, prefer Flutter's standardized build commands.

## Editing guidance for an AI coding agent

- Primary edit targets: files under `lib/`, `pubspec.yaml`, and tests under `test/` (create tests if missing).
- When changing dependencies: update `pubspec.yaml`, run `flutter pub get`, and ensure imports in `lib/` are updated.
- Run `flutter analyze` and `flutter test` after changes. If failures occur, prefer to fix Dart analysis errors first (missing imports, null-safety issues).
- Avoid modifying generated or platform-specific files unless the change requires platform APIs or plugin registration.

## Examples (from this repo)

- Entrypoint: `lib/main.dart` — simple MaterialApp scaffold. If asked to add a new screen, create a new Dart file under `lib/` and import it into `main.dart`.
- Dependency change example: to add `http` package, add `http: ^0.13.0` to `pubspec.yaml`, run `flutter pub get`, then `import 'package:http/http.dart' as http;` in the Dart file.

## Notes & gotchas

- Repo is a starter Flutter app — there may be no tests or CI configured. Add tests under `test/` and run `flutter test` before submitting changes.
- Platform builds (iOS) require macOS and proper signing — do not attempt iOS archive in CI unless credentials are provided.

---
If you want, I can: (1) open a draft PR with these instructions added, (2) extend the doc with a short local development checklist (emulator setup, device selection), or (3) add a `test/` example and CI snippet. Which would you like next?
