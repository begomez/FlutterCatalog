# BuyCycle

Flutter application displaying a collection of items and its detail view. Allows sorting and filtering. 



## Architecture Overview

Project is structured in the following layers/modules:

- PRESENTATION LAYER, which is Flutter dependent. This layer defines its own custom hierarchy of views:

*** screens (widgets usually used as containers, similar to Android activities)
*** widgets (pieces of UI with behavior, similar to Android fragments).

- DOMAIN LAYER, that provides state management through BLoC's for different use cases.
Ex: retrieving a product list.

- DATA LAYER, used to manage and orchestrate different data sources (although right now there is a
single source).

- NETWORK LAYER, which performs net connections (either real or fake) with remote server. Since there
is no real API attached, the components on this layer are dummy.

Aditionally, the COMMON directory contains data models shared across all the modules.



## About state management

Different state management approaches are implemented in the app, depending on the requirements:

- as mentioned before, data retrieval and widget rebuilding is done using the BLoC pattern.

- global data/state shared across different views is implemented with the "Lifting-State-Up" pattern.
The global storage component  created ("AppData") persists info about current ordering criteria and filters
and allows another components to query that info.

- local state for some widgets is persisted using simple state objects.



## About data structures

As mentioned above, data models included in the COMMON folder are share across all modules, so there
is no specific data model per layer.

Presentation layer does not use custom viewmodels for the corresponding widgets either.

Events in the DOMAIN folder are used to define use case inputs and provide type safety.



## About requested features

- The ordering criterias are supposed to be fixed, so they are stored in the app (as opposed to
being fetched dynamically). For a production ready app they should be dynamic so we can change them
without redeploying to the app stores. Ordering criterias implemented:

* price asc
* price desc
* bike categ
* bike name

- The bike types are supposed to be fixed, so they are stored in the app (as opposed to
being fetched dynamically). Bike types included:

* electric
* city
* mountain

- The filters are implemented dinamically. Data filters available:

* by max price
* by bike type
* by frame size

- Considering that in a production environment the catalog would contain hundreds/thousands of items,
filtering and ordering should be implemented in the backend to avoid performance issues.

Since there is no backend counterpart, these operations are implemented in the app, inside the DATA layer.
Why there? Because then we are able to reuse this logic when working with different data sources or BLoC's.
The sort/filter operation is performed on a different isolate so UI thread is not blocked. Nevertheless,
it should be implemented on the server-side, not the mobile app.

- The app uses a fake/dummy API that generates random data dinamically. That is important, since the
behavior is not the one we would get when working with real data. For instance:

* every time the ordering criteria changes, a new set of dummy data is generated.

* every time the filters change, a new set of dummy data is generated.

* when applying filters, if being so restrictive, then could be no data matching the criteria, so we
have to try again or reset the filters.

* after applying filters, if we order the data, then we will be generating a new set of data, so resulting
data will match the criterias too, but probably will not be the same data we were seeing previously.

- Supported langs: ES, EN



## About testing

The app contains basic test coverage in the "test" directory for the layers:

- network
- data
- domain
- common



## Build & run

flutter pub get
flutter build apk
flutter run



## Code generation commands

- Create mockito auto-generated classes:
flutter packages pub run build_runner build --delete-conflicting-outputs

Mockito gives some trouble after null-safety:
https://stackoverflow.com/questions/67290520/mockito-stub-a-method-after-the-null-safety-migration

- Generated launcher icons:
flutter pub run flutter_launcher_icons:main
