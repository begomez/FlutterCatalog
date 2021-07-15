# BuyCycle

Flutter application catalog displaying collection of items



## Architecture Overview

Project is structured in the following layers/modules:

- PRESENTATION LAYER is Flutter dependent. Defines its own custom hierarchy:

* screens (widgets usually used as containers, similar to Android activities)
* widgets (pieces of UI with behavior, similar to Android fragments).

- DOMAIN LAYER provides state management through BLoC's for different use cases.
Ex: retrieving a product list.

- DATA LAYER is used to manage and orchestrate different data sources (although right now there is a
single source).

- NETWORK LAYER performs net connections (either real or fake) with remote server.



## About state management

Different state management approaches are implemented in the app, depending on the requirements:

- as mentioned before, data retrieval and widget rebuilding is done using the BLoC pattern.

- global data/state shared across different views is implemented with the "Lifting-State-Up" pattern.
The global storage component contains info about current ordering criteria and filters.

- local state for some widgets is persisted using simple state objects.



## About data structures

For simplicity, data models are share across all modules, so there is no specific data model per layer.
Presentation layer does not
use custom viewmodels for the corresponding widgets either.

Events (in fact just simple Data Transport Object) are used to define use case inputs in domain
layer and provide type safety.



## About requested features

- The ordering criterias are supposed to be fixed, so they are stored in the app (as opposed to
being fetched dynamically). For a production ready app they should be dynamic so we can change them
without redeploying to the app stores.

- The bike types are supposed to be fixed, so they are stored in the app (as opposed to
being fetched dynamically).

- Considering that in a production environment the catalog would contain thousands of items, filtering
and ordering should be implemented in the backend. Since there is no backend support, these operations
are implemented in the app, inside the DATA layer. Why? Because then we would be able to reuse this logic
when working with different data sources or BLoC. The operation is performed on a different isolate so
UI thread is not blocked. Nevertheless, as mentioned before, it should be implemented in the server-side,
not the client.

- The app uses a fake/dummy API that generates random data dinamically. That is important since the
behavior is not the one we would get when working with a real remote server. For instance:

* every time the ordering criteria changes, a new set of dummy data is generated.

* every time the filters change, a new set of dummy data is generated.

* when applying filters, if being so restrictive, then could be no generated data matching the criteria,
so we have to try again or reset them.

* after applying filters, if we order the data, we will be generating a new set of data, so resulting data
will match the criteria for order and filter too, but probably will not be the same data we were seeing
previously.



## About testing

The app contains several unit tests in the "test" directory.



## Build & run

flutter pub get
flutter run --debug



## Code generation commands

- Mockito auto generated classes (one of the following cmd):
flutter packages pub run build_runner build --delete-conflicting-ouputs
dart run build_runner build

- Launcher icons:
flutter pub run flutter_launcher_icons:main