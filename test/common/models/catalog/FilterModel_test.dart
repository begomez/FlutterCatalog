import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/BikeModel.dart';
import 'package:flutter_catalog/common/models/catalog/FilterModel.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';
import 'package:flutter_catalog/common/models/catalog/PriceModel.dart';
import 'package:test/test.dart';


void main() {
  test("When having no criteria then invalid", () {
    final FilterModel filter = FilterModel.empty();

    expect(filter.validate(), false);
  });

  test("When having price then valid", () {
    final FilterModel filter = FilterModel(price: PriceModel.unit().amount);

    expect(filter.validate(), true);
  });

  test("When having frame size then valid", () {
    final FilterModel filter = FilterModel(frameSize: FrameSizeModel.min().size);

    expect(filter.validate(), true);
  });

  test("When having categories then valid", () {
    final FilterModel filter = FilterModel(categs: BikeCategories.values);

    expect(filter.validate(), true);
  });

  test("When copying with prices then categories are mantained", () {
    final FilterModel original = FilterModel(frameSize: FrameSizeModel.max().size, categs: BikeCategories.values);
    final FilterModel copy = original.copyWith(price: PriceModel.unit().amount);

    expect(original.categs == copy.categs, true);
    expect(original.frameSize == copy.frameSize, true);
    expect(original.price == copy.price, false);
    expect(original.price != copy.price, true);
  });

  test("When copying with frames then prices are mantained", () {
    final FilterModel original = FilterModel(frameSize: FrameSizeModel.max().size, price: PriceModel.unit().amount);
    final FilterModel copy = original.copyWith(frameSize: FrameSizeModel.min().size);

    expect(original.price == copy.price, true);
    expect(original.categs == copy.categs, true);
    expect(original.frameSize == copy.frameSize, false);
    expect(original.frameSize != copy.frameSize, true);
  });

  test("When copying with categs then frames are mantained", () {
    final FilterModel original = FilterModel(frameSize: FrameSizeModel.max().size, price: PriceModel.unit().amount);
    final FilterModel copy = original.copyWith(categs: [BikeCategories.CITY]);

    expect(original.price == copy.price, true);
    expect(original.frameSize == copy.frameSize, true);
    expect(original.categs == copy.categs, false);
    expect(original.categs != copy.categs, true);
  });

}