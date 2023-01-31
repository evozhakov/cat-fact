# Cat Facts

A simple app that displays flashcards that contain a random [image](https://cataas.com) and a text [fact](https://catfact.ninja').

- [Download the apk file for Android.](https://drive.google.com/file/d/1Q-KZp6UzTeVygifl_dYa1eJD9HCceP5W/view?usp=share_link)
- [Watch a short video.](https://drive.google.com/file/d/17JP4I-tzNFGHGvXMxvE5mbrWJJj0jbtq/view?usp=share_link)

## How it works

- [Retrofit](https://pub.dev/packages/retrofit) with [dio](https://pub.dev/packages/dio) is used to request the api.
- A [BloС](https://pub.dev/packages/flutter_bloc) is used for state management.
- A [Hive](https://pub.dev/packages/hive_flutter) is used to store facts.
- The application supports [localization](https://pub.dev/packages/flutter_localization) (languages: English as a base, Ukrainian, French, Hebrew).

## Basic functions

- Get some facts and pictures about cats.
- Share these facts and pictures.
- Keep the facts.
- Use the settings (available functions: delete all saved facts, set the number of cards that will be loaded).