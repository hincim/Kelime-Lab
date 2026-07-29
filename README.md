# Kelime Lab

Kelime Lab is a Flutter-based vocabulary practice app focused on Turkish–English word learning. It lets users build a local word list, search stored words, auto-suggest translations, and practice with flashcards and multiple-choice quizzes.

## Current Scope

This repository contains a multi-platform Flutter app (Android, iOS, Web, Windows, Linux, macOS) with a local SQLite-backed vocabulary workflow.

## Features

- **Local vocabulary management**
  - Add English/Turkish word pairs
  - List words in alphabetical order
  - Search by English or Turkish text
  - Delete a single word or clear all words
- **Translation-assisted word entry**
  - Uses an external translation API via `API_KEY` and `BASE_URL` from `.env`
  - Supports both `tr-en` and `en-tr` lookup flow in the add-word screen
- **Practice modes**
  - **Word Cards**: flip card language and listen using text-to-speech
  - **Multiple Choice Quiz**: random questions with score tracking
- **Session/UI behavior**
  - Splash screen and login flow
  - Bottom navigation between home, practice, tools, and contact tabs
  - Last viewed flashcard index persisted with `shared_preferences`

## Technology Stack

- **Framework:** Flutter (Dart SDK `^3.6.0`)
- **State Management:** `provider`, `flutter_bloc`
- **Local Storage:** `sqflite`
- **Networking:** `dio`, `http`
- **Environment Config:** `flutter_dotenv`
- **Utilities:** `flutter_svg`, `flutter_tts`, `shared_preferences`, `fluttertoast`

## Project Structure

```text
/home/runner/work/Kelime-Lab/Kelime-Lab
├── lib/
│   ├── main.dart
│   ├── db/                 # SQLite data access layer
│   ├── controller/         # Provider-based controllers
│   ├── cubit/              # Bloc/Cubit translation state
│   ├── model/              # Data models
│   ├── util/               # Reusable UI helpers/widgets
│   └── views/              # App screens
├── assets/                 # Images, icons, fonts
├── test/                   # Flutter tests
└── pubspec.yaml
```

## Prerequisites

- Flutter SDK installed
- A configured Flutter toolchain for your target platform(s)

## Setup

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Create a `.env` file in the repository root:

   ```env
   API_KEY=your_api_key
   BASE_URL=your_translation_api_endpoint
   ```

   `API_KEY` and `BASE_URL` are read in `lib/controller/TranslateController.dart`.

3. Run the app:

   ```bash
   flutter run
   ```

## Authentication (Current Implementation)

The login screen currently checks hardcoded credentials in `lib/views/LoginPage.dart`:

- Email: `hakan@gmail.com`
- Password: `123456`

## Notes on Current Implementation

- `ToolsPage` currently renders a placeholder text (`"Araçlar Ekranı"`).
- `SignInPage` UI exists, but registration logic is not implemented.
- Contact panel includes a hardcoded email string.

## Testing

Run existing tests with:

```bash
flutter test
```
