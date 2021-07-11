import '../../common/models/FilterModel.dart';
import '../../common/models/OrderCriteriaModel.dart';

import 'core/BaseEvent.dart';


/*
 * Input class used for catalog BLoC
 */
class CatalogEvent extends BaseEvent {
  final int page;
  final OrderCriteriaModel order;
  final FilterModel filter;

  const CatalogEvent(this.page, this.order, this.filter);

  @override
  String toString() => "${page.toString()} ${this.filter.toString()} ${this.order.toString()}";
}
