import 'package:flutter/material.dart';

import '../core/BaseModel.dart';


/*
 * Factory that provides ordering criteria objects
 */
abstract class OrderCriteriaModelFactory {

  static List<OrderCriteriaModel> getAllCriterias({@required String lbPriceAsc, @required String lbPriceDesc}) => [
    priceAscending(lbPriceAsc),
    priceDescending(lbPriceDesc)
  ];

  static OrderCriteriaModel defaultCriteria() => priceAscending("Price asc.");

  static OrderCriteriaModel priceAscending(String lbPriceAsc) => OrderCriteriaModel.priceAscending(lbPriceAsc);

  static OrderCriteriaModel priceDescending(String lbPriceDesc) => OrderCriteriaModel.priceDescending(lbPriceDesc);
}

/*
 * Model that encapsulates info about an ordering criteria.
 * Has no visible constructors, enforcing instantiation of objects through
 * the OrderCriteriaModelFactory object
 *
 */
class OrderCriteriaModel extends BaseModel {
  final int id;
  final String name;
  final bool reverse;


  const OrderCriteriaModel._(this.id, this.name, this.reverse) : super();

  factory OrderCriteriaModel.priceAscending(String lb) => OrderCriteriaModel._(1, lb, false);

  factory OrderCriteriaModel.priceDescending(String lb) => OrderCriteriaModel._(2, lb, true);

  @override
  bool validate() {
    this.id != null && this.name.isNotEmpty;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderCriteriaModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          reverse == other.reverse;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ reverse.hashCode;
}