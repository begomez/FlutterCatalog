import 'package:flutter/material.dart';
import 'FilterModel.dart';
import '../catalog/OrderCriteriaModel.dart';
import '../core/BaseModel.dart';


/*
 * Model encapsulating catalog-related settings: ordering, filter
 */
class SettingsModel extends BaseModel {
  final FilterModel filter;
  final OrderCriteriaModel order;

  const SettingsModel(this.filter, this.order) : super();

  factory SettingsModel.defaultSettings() =>
      SettingsModel(
          FilterModel.defaultFilter(),
          OrderCriteriaModelFactory.defaultCriteria()
      );

  SettingsModel copyWith({FilterModel filter, OrderCriteriaModel order}) {
    return SettingsModel(filter?? this.filter, order?? this.order);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModel &&
          runtimeType == other.runtimeType &&
          filter == other.filter &&
          order == other.order;

  @override
  int get hashCode => filter.hashCode ^ order.hashCode;
}