import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/filters/OrderCriteriaModel.dart';
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

  test("When having id 1 then price asc categ", () {
    OrderCriteriaModel order = OrderCriteriaModelFactory.priceAscending("someLb");

    expect(order.isPriceAsc(), true);
    expect(order.isPriceDesc(), false);
    expect(order.isCategAsc(), false);
    expect(order.isNameAsc(), false);
  });

  test("When having id 2 then price desc categ", () {
    OrderCriteriaModel order = OrderCriteriaModelFactory.priceDescending("someLb");

    expect(order.isPriceAsc(), false);
    expect(order.isPriceDesc(), true);
    expect(order.isCategAsc(), false);
    expect(order.isNameAsc(), false);
  });

  test("When having id 3 then categ asc categ", () {
    OrderCriteriaModel order = OrderCriteriaModelFactory.categAscending("someLb");

    expect(order.isPriceAsc(), false);
    expect(order.isPriceDesc(), false);
    expect(order.isCategAsc(), true);
    expect(order.isNameAsc(), false);
  });

  test("When having id 4 then name asc categ", () {
    OrderCriteriaModel order = OrderCriteriaModelFactory.nameAscending("someLb");

    expect(order.isPriceAsc(), false);
    expect(order.isPriceDesc(), false);
    expect(order.isCategAsc(), false);
    expect(order.isNameAsc(), true);
  });

}