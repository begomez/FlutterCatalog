import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/filters/OrderCriteriaModel.dart';
import 'package:flutter_catalog/common/models/filters/CatalogSettingsModel.dart';
import 'package:test/test.dart';

void main() {
  test("When copying order then values are mantained", () {
    CatalogSettingsModel original = CatalogSettingsModel(
        FakeModelFactory.randomFilter(),
        OrderCriteriaModelFactory.defaultCriteria());
    CatalogSettingsModel copy = original.copyWith(
        order: OrderCriteriaModelFactory.priceDescending("lbPriceDesc"));

    expect(original.filter == copy.filter, true);
    expect(original.order == copy.order, false);
    expect(original.order != copy.order, true);
  });

  test("When copying filter then values are mantained", () {
    CatalogSettingsModel original = CatalogSettingsModel(
        FakeModelFactory.randomFilter(),
        OrderCriteriaModelFactory.defaultCriteria());
    CatalogSettingsModel copy =
        original.copyWith(filter: FakeModelFactory.randomFilter());

    expect(original.order == copy.order, true);
    expect(original.filter == copy.filter, false);
    expect(original.filter != copy.filter, true);
  });
}
