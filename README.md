## Getting Started

Some library project using :

## Bloc / Flutter_Bloc : An Architecture MVVM for flutter. Read more in here :

https://bloclibrary.dev/#/

## Sembast database library : NoSQL database using library sembast to save data in local database

https://pub.dev/packages/sembast

## Multi-languages : Using easy_localization with multi-languages :

https://pub.dev/packages/easy_localization

Generate LocaleKey with library
flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart

then import "generated/locale_keys.g.dart";

Usage :
print(LocaleKeys.title.tr()); //String
//or
Text(LocaleKeys.title).tr(); //Widget

NOTE : After add new value to jsonLanguagesFile you need to generate again to have new data

## Json_serializable : Use to generate a model class to Json data with function fromJson and toJson automatically without cost time to code

https://pub.dev/packages/json_serializable

2 terminal need to remind :
    - flutter pub run build_runner build : Use to generate file you've define in model class
    - flutter pub run build_runner build --delete-conflicting-outputs : Use to generate new file and delete old conflicting file you've already generate.
     Use in case terminal 1 is error

## Coding convention - Naming convention : Use pedantic package to auto-check coding convention and naming convention when code

https://dart.dev/guides/language/analysis-options

## Get-it : Dependencies Injector -> Using like provider but without context. Just only registry first time in main class and use every where

https://pub.dev/packages/get_it

## Run with environment

- Development:
  - Debug:  ```flutter run -t lib/main/main_development.dart --flavor development```
  - Release:
    - IOS: ```flutter build ios -t lib/main/main_development.dart --flavor development```
    - Android: ```flutter build apk -t lib/main/main_development.dart --flavor development```

- Staging:
  - Debug:  ```flutter run -t lib/main/main_staging.dart --flavor staging```
  - Release:
    - IOS: ```flutter build ios -t lib/main/main_staging.dart --flavor staging```
    - Android: ```flutter build apk -t lib/main/main_staging.dart --flavor staging```

- Production:
  - Debug:  ```flutter run -t lib/main/main_production.dart --flavor production```
  - Release:
    - IOS: ```flutter build ios -t lib/main/main_production.dart --flavor production```
    - Android: ```flutter build apk -t lib/main/main_production.dart --flavor production```

- Script build.sh build:
  - run: ./build.sh $environment
    ```note:
      environment: development, staging, release
      eg: build with development: ./build.sh development
      [warring]: in first time run `chmod +x build.sh` for add permission file!
    ```
