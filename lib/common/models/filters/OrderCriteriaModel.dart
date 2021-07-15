import 'package:flutter/material.dart';

import '../catalog/BikeModel.dart';
import '../core/BaseModel.dart';


/*
 * Factory that provides ordering criteria objects
 */
abstract class OrderCriteriaModelFactory {
  static const PRICE_ASC = 1;
  static const PRICE_DESC = 2;
  static const CATEG_ASC = 3;
  static const NAME_ASC = 4;

  static List<OrderCriteriaModel> getAllCriterias({@required String lbPriceAsc, @required String lbPriceDesc, @required String lbCategAsc, @required lbNameAsc}) => [
    priceAscending(lbPriceAsc),
    priceDescending(lbPriceDesc),
    categAscending(lbCategAsc),
    nameAscending(lbNameAsc),
  ];

  static OrderCriteriaModel defaultCriteria() => priceAscending("Price asc.");

  static OrderCriteriaModel priceAscending(String lbPriceAsc) => OrderCriteriaModel.priceAscending(lbPriceAsc);

  static OrderCriteriaModel priceDescending(String lbPriceDesc) => OrderCriteriaModel.priceDescending(lbPriceDesc);

  static OrderCriteriaModel categAscending(String lbCategAsc) => OrderCriteriaModel.categAscending(lbCategAsc);

  static OrderCriteriaModel nameAscending(String lbNameAsc) => OrderCriteriaModel.nameAscending(lbNameAsc);
}

/*
 * Model that encapsulates ordering criteria.
 *
 * Has no visible constructors, enforcing instantiation of objects
 * through OrderCriteriaModelFactory object
 *
 */
class OrderCriteriaModel extends BaseModel {
  final int id;
  final String name;
  final bool reverse;


  const OrderCriteriaModel._(this.id, this.name, this.reverse) : super();

  factory OrderCriteriaModel.priceAscending(String lb) => OrderCriteriaModel._(OrderCriteriaModelFactory.PRICE_ASC, lb, false);

  factory OrderCriteriaModel.priceDescending(String lb) => OrderCriteriaModel._(OrderCriteriaModelFactory.PRICE_DESC, lb, true);

  factory OrderCriteriaModel.categAscending(String lb) => OrderCriteriaModel._(OrderCriteriaModelFactory.CATEG_ASC, lb, false);

  factory OrderCriteriaModel.nameAscending(String lb) => OrderCriteriaModel._(OrderCriteriaModelFactory.NAME_ASC, lb, false);

  @override
  bool validate() {
    return this.id != null && this.name.isNotEmpty;
  }

  bool isPriceAsc() => this._isSomeCateg(OrderCriteriaModelFactory.PRICE_ASC);
  bool isPriceDesc() => this._isSomeCateg(OrderCriteriaModelFactory.PRICE_DESC);
  bool isCategAsc() => this._isSomeCateg(OrderCriteriaModelFactory.CATEG_ASC);
  bool isNameAsc() => this._isSomeCateg(OrderCriteriaModelFactory.NAME_ASC);
  bool _isSomeCateg(int target) => this.id == target;

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

  @override
  String toString() {
    return "id: $id name: $name reverse: $reverse";
  }

  /*
   * Returns comparator for the current ordering criteria
   */
  Comparator<BikeModel> getComparator() {
    Comparator<BikeModel> comp;

    if (this.isPriceAsc()) {
      comp = (a, b) => (a.price.amount - b.price.amount).toInt();

    } else if (this.isPriceDesc()) {
      comp = (a, b) => (b.price.amount - a.price.amount).toInt();

    } else if (this.isCategAsc()) {
      comp = (a, b) => (a.categ.toString().compareTo(b.categ.toString()));

    } else {
      comp = (a, b) => (a.name.compareTo(b.name));
    }

    return comp;
  }
}