# Forever Pets

A Flutter app for browsing cat breeds, powered by [The Cat API](https://thecatapi.com/). Pick a category, search for a breed, and open a detail page with its traits and info.

## Features

- Onboarding screen
- Home screen with breed cards loaded from The Cat API
- Search bar and category selector
- Breed details page with info boxes
- Bottom navigation
- Responsive layout with `flutter_screenutil`
- Native splash screen

## Architecture

Feature-first structure with a shared `core` layer:

```
lib/
├── main.dart
├── forever_app.dart
├── core/
│   ├── constants/
│   ├── dependency_injection/   get_it setup
│   ├── network/                Dio factory, Retrofit API service, error handling
│   ├── routes/                 App router
│   ├── theme/                  Colors, text styles, spacing
│   └── widgets/                App bar, bottom nav, category selector
└── features/
    ├── boarding/
    ├── home/                   Breeds repository, models, Cubit, pages
    └── details/
```

State is managed with **Cubit** (flutter_bloc). API calls go through **Retrofit + Dio**, and results are wrapped in an `ApiResult` type with central error handling.

## Tech Stack

| Concern | Packages |
|---|---|
| State | flutter_bloc |
| DI | get_it |
| Networking | dio, retrofit, pretty_dio_logger |
| Models | freezed, json_serializable |
| UI | flutter_screenutil, flutter_svg, shimmer_animation, flutter_native_splash |
| Config | flutter_dotenv |

## Getting Started

1. Get a free API key from [The Cat API](https://thecatapi.com/).
2. Create a `.env` file in the project root:
   ```
   API_KEY=your_cat_api_key
   ```
3. Install and run:
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   flutter run
   ```
