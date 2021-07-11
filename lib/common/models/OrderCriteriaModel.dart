import 'core/BaseModel.dart';


/*
 * Factory that provides ordering criteria objects
 */
abstract class OrderCriteriaModelFactory {
  static OrderCriteriaModel priceAscending() => OrderCriteriaModel.priceAscending();

  static OrderCriteriaModel priceDescending() => OrderCriteriaModel.priceDescending();
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

  factory OrderCriteriaModel.priceAscending() => OrderCriteriaModel._(1, "price", false);

  factory OrderCriteriaModel.priceDescending() => OrderCriteriaModel._(2, "price", true);

  @override
  bool validate() {
    this.name.isNotEmpty;
  }
}