import '../../common/models/filters/FilterModel.dart';
import '../../common/models/filters/OrderCriteriaModel.dart';

import 'core/BaseEvent.dart';


/*
 * Input class for catalog BLoC
 *
 * @see CatalogBloc
 */
class CatalogEvent extends BaseEvent {
  final int page;
  final OrderCriteriaModel order;
  final FilterModel filter;

  const CatalogEvent(this.page, this.order, this.filter);

  @override
  String toString() => "${page.toString()} ${this.filter.toString()} ${this.order.toString()}";
}
