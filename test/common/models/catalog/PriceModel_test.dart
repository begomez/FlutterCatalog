import 'package:flutter_catalog/common/models/catalog/PriceModel.dart';
import 'package:test/test.dart';
import 'dart:math';


void main() {
  test("When free price then has 0.0 value", () {
    final PriceModel price = PriceModel.free();

    expect(price.amount, 0.0);
  });

  test("When unit price then has 1.0 value", () {
    final PriceModel price = PriceModel.unit();

    expect(price.amount, 1.0);
  });

  test("When no currency then default currency is Euro", () {
    final PriceModel price = PriceModel.forAmount(Random().nextInt(3).toDouble());

    expect(price.currency, PriceModel.DEFAULT_CURRENCY);
  });

  test("When negative amount then it is not valid", () {
    final PriceModel price = PriceModel.forAmount(-2.0);

    expect(price.validate(), false);
  });

  test("When having same value and diff currency then not equal", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 1.0, currency: "\$");

    expect(price1 == price2, false);
  });

  test("When having same value and same currency then equal", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price1 == price2, true);
  });

  test("When having diff value then not equal", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 2.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price1 == price2, false);
  });

  test("When having same value and diff currency then equal", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price1 == price2, true);
  });

  test("When having same value and same currency then same hashcode", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price1.hashCode == price2.hashCode, true);
  });

  test("When having less amount then is minor than", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 2.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price1 < price2, true);
  });

  test("When having more amount then is greater than", () {
    final PriceModel price1 = PriceModel(amount: 1.0, currency: PriceModel.DEFAULT_CURRENCY);
    final PriceModel price2 = PriceModel(amount: 2.0, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price2 > price1, true);
  });

  test("When formatting to string then displaying currency", () {
    final PriceModel price = PriceModel(amount: 99.99, currency: PriceModel.DEFAULT_CURRENCY);

    expect(price.toString().endsWith(" €"), true);
  });

  test("When formatting to string then setting 2 decimal positions", () {
    final PriceModel price = PriceModel.forAmount(3.141592);

    expect(price.toString().substring(price.toString().indexOf(".") + 1, price.toString().indexOf(" ")).length, PriceModel.NUM_DECIMALS);
  });
}