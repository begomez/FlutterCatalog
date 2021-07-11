import 'package:flutter/material.dart';
import '../../common/models/FilterModel.dart';
import '../../common/models/OrderCriteriaModel.dart';
import '../../common/models/core/BaseModel.dart';


/*
 * Model encapsulating catalog settings: ordering, filter
 */
class SettingsModel extends BaseModel {
  final FilterModel filter;
  final OrderCriteriaModel order;

  const SettingsModel(this.filter, this.order) : super();

  factory SettingsModel.defaultSettings() =>
      SettingsModel(
          FilterModel.empty(),
          OrderCriteriaModelFactory.defaultCriteria()
      );

  SettingsModel copyWith({FilterModel filter, OrderCriteriaModel order}) {
    return SettingsModel(filter?? this.filter, order?? this.order);
  }
}