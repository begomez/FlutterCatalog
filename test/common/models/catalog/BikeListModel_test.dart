import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/BikeListModel.dart';
import 'package:test/test.dart';


void main() {
  test("When having data no pagination then invalid", () {
    BikeListModel bikes = BikeListModel(collection: [
      FakeModelFactory.randomBike(id: 1)
    ]);

    expect(bikes.validate(), false);
  });

  test("When having data and pagination then valid", () {
    BikeListModel bikes = BikeListModel(collection: [
        FakeModelFactory.randomBike(id: 1),
      ],
      pagination: FakeModelFactory.paginationForPage(1)
    );

    expect(bikes.validate(), true);
  });

  test("When having no data then invalid", () {
    BikeListModel bikes = BikeListModel(collection: const []);

    expect(bikes.validate(), false);
  });
}