import '../../common/models/catalog/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';

import 'core/BaseEvent.dart';


/*
 * Input class used for catalog BLoC
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
