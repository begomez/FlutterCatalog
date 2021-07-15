import '../catalog/OrderCriteriaModel.dart';
import '../core/BaseModel.dart';
import 'FilterModel.dart';


/*
 * Model encapsulating catalog-related settings: ordering, filter
 */
class SettingsModel extends BaseModel {
  final FilterModel filter;
  final OrderCriteriaModel order;
  final int timestamp;

  const SettingsModel(this.filter, this.order, {this.timestamp = 0}) : super();

  factory SettingsModel.defaultSettings() =>
      SettingsModel(
          FilterModel.defaultFilter(),
          OrderCriteriaModelFactory.defaultCriteria(),
          timestamp: DateTime.now().millisecondsSinceEpoch
      );

  SettingsModel copyWith({FilterModel filter, OrderCriteriaModel order}) {
    return SettingsModel(filter?? this.filter, order?? this.order, timestamp: DateTime.now().millisecondsSinceEpoch);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModel &&
          runtimeType == other.runtimeType &&
          filter == other.filter &&
          order == other.order &&
          timestamp == other.timestamp;

  @override
  int get hashCode => filter.hashCode ^ order.hashCode ^ timestamp.hashCode;
}