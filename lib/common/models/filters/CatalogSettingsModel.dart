import 'OrderCriteriaModel.dart';
import '../core/BaseModel.dart';
import 'FilterModel.dart';


/*
 * Model encapsulating all catalog-related settings: ordering, filter
 */
class CatalogSettingsModel extends BaseModel {
  final FilterModel filter;
  final OrderCriteriaModel order;
  final int timestamp;

  const CatalogSettingsModel(this.filter, this.order, {this.timestamp = 0}) : super();

  factory CatalogSettingsModel.defaultSettings() =>
      CatalogSettingsModel(
          FilterModel.defaultFilter(),
          OrderCriteriaModelFactory.defaultCriteria(),
          timestamp: DateTime.now().millisecondsSinceEpoch
      );

  CatalogSettingsModel copyWith({FilterModel filter, OrderCriteriaModel order}) {
    return CatalogSettingsModel(filter?? this.filter, order?? this.order, timestamp: DateTime.now().millisecondsSinceEpoch);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogSettingsModel &&
          runtimeType == other.runtimeType &&
          filter == other.filter &&
          order == other.order &&
          timestamp == other.timestamp;

  @override
  int get hashCode => filter.hashCode ^ order.hashCode ^ timestamp.hashCode;
}