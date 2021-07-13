import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/BikeModel.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';
import 'package:flutter_catalog/common/models/catalog/PriceModel.dart';
import 'package:test/test.dart';


void main() {
  test("When having no price then invalid", () {
    BikeModel bike = BikeModel(
      id: 1,
      categ: BikeCategories.CITY,
      frameSize: FakeModelFactory.randomFrame(),
      name: "Some bike",
      mainImg: FakeModelFactory.randomImg()
    );

    expect(bike.validate(), false);
  });

  test("When having no id then invalid", () {
    BikeModel bike = BikeModel(
      price: PriceModel.unit(),
      categ: BikeCategories.CITY,
      frameSize: FakeModelFactory.randomFrame(),
      name: "Some bike",
      mainImg: FakeModelFactory.randomImg()
    );

    expect(bike.validate(), false);
  });

  test("When having no name then invalid", () {
    BikeModel bike = BikeModel(
      id: 1,
      categ: BikeCategories.CITY,
      frameSize: FakeModelFactory.randomFrame(),
      price: PriceModel.unit(),
      mainImg: FakeModelFactory.randomImg()
    );

    expect(bike.validate(), false);
  });

  test("When having id, name, price then valid", () {
    BikeModel bike = BikeModel(
        id: 1,
        name: "Some bike",
        categ: BikeCategories.CITY,
        frameSize: FakeModelFactory.randomFrame(),
        price: PriceModel.unit(),
        mainImg: FakeModelFactory.randomImg()
    );

    expect(bike.validate(), true);
  });

  test("When having diff values then not equal", () {
    BikeModel bike1 = BikeModel(
        id: 1,
        categ: BikeCategories.CITY,
        frameSize: FrameSizeModel(size: 1),
        price: PriceModel.unit(),
        mainImg: FakeModelFactory.randomImg()
    );

    BikeModel bike2 = BikeModel(
        id: 2,
        categ: BikeCategories.CITY,
        frameSize: FrameSizeModel(size: 1),
        price: PriceModel.unit(),
        mainImg: FakeModelFactory.randomImg()
    );

    expect(bike1 == bike2, false);
  });

  test("When having same values then equal", () {
    BikeModel bike1 = BikeModel(
        id: 1,
        name: "Some bike",
        categ: BikeCategories.CITY,
        frameSize: FrameSizeModel.min(),
        price: PriceModel.unit(),
        mainImg: FakeModelFactory.randomImg()
    );

    BikeModel bike2 = bike1;

    expect(bike1 == bike2, true);
  });

  test("When having same values then same hash", () {
    BikeModel bike1 = BikeModel(
        id: 1,
        name: "Some bike",
        categ: BikeCategories.CITY,
        frameSize: FrameSizeModel.max(),
        price: PriceModel.unit(),
        mainImg: FakeModelFactory.randomImg()
    );

    BikeModel bike2 = bike1;

    expect(bike1.hashCode == bike2.hashCode, true);
  });

}