import 'package:flutter/material.dart';

import '../../common/models/filters/SettingsModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';


/*
 * Simple impl. of "Lifting state up" pattern using an inherited widget that holds global app state
 */
class AppData extends InheritedWidget {
  ValueNotifier<SettingsModel> vSettings;


  AppData({@required Widget child,  Key key}) : assert(child != null), super(key: key, child: child) {
    this.vSettings = ValueNotifier<SettingsModel>(SettingsModel.defaultSettings());
  }

  static AppData of(BuildContext cntxt) {
    return cntxt.dependOnInheritedWidgetOfExactType<AppData>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

////////////////////////////////////////////////////////////////////////////////
// STATE
////////////////////////////////////////////////////////////////////////////////

  void updateOrder(OrderCriteriaModel order) {
    this.vSettings.value = this.vSettings.value.copyWith(order: order);
  }

  void updateFilter(FilterModel filter) {
    this.vSettings.value = this.vSettings.value.copyWith(filter: filter);
  }
}