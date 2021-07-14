# flutter_template

Flutter architecture template.

## Architecture Overview

Project is structured in the following layers/modules:

- Presentation

- Domain

- Data

- Network

PRESENTATION LAYER is Flutter dependent. Defines its own custom hierarchy: screens (
widgets usually used as containers, similar to Android activities) and widgets (pieces of UI with behavior, similar to
Android fragments).

DOMAIN LAYER provides state management through BLoC's for different use cases. Ex: performing a login

DATA LAYER is used to manage and orchestrate different data sources.

NETWORK LAYER performs net connections either directly or indirectly.

Data models are share across all modules, there is no custom data model per layer.

Events (in fact just simple Data Transport Object) are used to define use case inputs in domain layer and provide type safety.

## Code generation commands

JSON serializable classes when required:
flutter packages pub run build_runner build --delete-conflicting-ouputs

Mockito auto generated classes:
flutter packages pub run build_runner build
dart run build_runner build
