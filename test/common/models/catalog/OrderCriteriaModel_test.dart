import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/OrderCriteriaModel.dart';
import 'package:test/test.dart';


void main() {
  test("When having same values then equal", () {
    OrderCriteriaModel order1 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");
    OrderCriteriaModel order2 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");

    expect(order1 == order2, true);
  });

  test("When having same values then same hash", () {
    OrderCriteriaModel order1 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");
    OrderCriteriaModel order2 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");

    expect(order1.hashCode == order2.hashCode, true);
  });


  test("When having diff values then not equal", () {
    OrderCriteriaModel order1 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");
    OrderCriteriaModel order2 = OrderCriteriaModelFactory.priceDescending("lbPriceDesc");

    expect(order1 == order2, false);
  });

  test("When having diff values then diff hash", () {
    OrderCriteriaModel order1 = OrderCriteriaModelFactory.priceAscending("lbPriceAsc");
    OrderCriteriaModel order2 = OrderCriteriaModelFactory.priceDescending("lbPriceDesc");

    expect(order1.hashCode == order2.hashCode, false);
  });

}