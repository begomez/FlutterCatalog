import 'package:flutter_catalog/common/models/core/BaseModel.dart';


enum PriceRanges {AFFORDABLE, MID, EXPENSIVE}

/*
 * Data model that represents a price entity, encapsulating a currency and a certain amount.
 * Ex: 99.99 €
 */
class PriceModel extends BaseModel {
  static const NUM_DECIMALS = 2;
  static const DEFAULT_CURRENCY = "€";
  static const NO_AMOUNT = 0.0;

  final String currency;
  final double amount;

  const PriceModel({this.currency = DEFAULT_CURRENCY, this.amount = NO_AMOUNT}) : super();

  factory PriceModel.free() => const PriceModel();

  @override
  bool validate() => this.amount > NO_AMOUNT;

  @override
  String toString() {
    return "${this.amount.toStringAsFixed(NUM_DECIMALS)} ${this.currency}";
  }
}