import '../core/BaseModel.dart';

/*
 * Enum with available price categories
 */
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

  factory PriceModel.unit() => const PriceModel(amount: 1.0);

  factory PriceModel.forAmount(double amount) => PriceModel(amount: amount, currency: DEFAULT_CURRENCY);

  @override
  bool validate() => this.amount > NO_AMOUNT;//XXX: not selling "for free"...

  @override
  String toString() {
    return "${this.amount.toStringAsFixed(NUM_DECIMALS)} ${this.currency}";
  }

  bool operator <(Object other) {
    if (other is PriceModel) {
      return this.amount < other.amount;

    } else {
      return false;
    }
  }

  bool operator >(Object other) {
    if (other is PriceModel) {
      return this.amount > other.amount;

    } else {
      return false;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceModel &&
          runtimeType == other.runtimeType &&
          currency == other.currency &&
          amount == other.amount;

  @override
  int get hashCode => currency.hashCode ^ amount.hashCode;
}