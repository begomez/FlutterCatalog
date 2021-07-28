import 'package:flutter_catalog/common/models/catalog/PriceModel.dart';
import 'package:flutter_catalog/common/models/catalog/PriceRangeModel.dart';
import 'package:test/test.dart';

void main() {
  test("When min < max then valid", () {
    final PriceRangeModel range = PriceRangeModel(
        min: PriceModel.unit(), max: PriceModel.forAmount(10.0));

    expect(range.validate(), true);
  });

  test("When min > max then invalid", () {
    final PriceRangeModel range =
        PriceRangeModel(max: PriceModel.unit(), min: PriceModel.forAmount(6.0));

    expect(range.validate(), false);
  });

  test("When invalid constructor then does not validate", () {
    final PriceRangeModel range = PriceRangeModel.invalid();

    expect(range.validate(), false);
  });

  test("When havin min and max then step size is calculated", () {
    final PriceRangeModel range =
        PriceRangeModel(min: PriceModel.unit(), max: PriceModel.forAmount(6.0));

    expect(range.getStepSize(), 1.0);
  });
}
