import 'package:flutter/material.dart';

import '../../common/models/filters/SettingsModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';


/*
 * Simple impl. of "Lifting state up" pattern using an inherited widget that holds global app state
 */
class AppData extends InheritedWidget {

  /*
   * Observable data storing ordering and applied filters
   */
  ValueNotifier<SettingsModel> vSettings;

  /*
   * Temporary, not observable data, to store filter selection before submitting filter changes
   */
  FilterModel filterCache;

  AppData({@required Widget child,  Key key}) : assert(child != null), super(key: key, child: child) {
    this.vSettings = ValueNotifier<SettingsModel>(SettingsModel.defaultSettings());
    this.filterCache = FilterModel.defaultFilter();
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

  void applyFilterCache() {
    this.updateFilter(this.filterCache);
  }

  void updateOrder(OrderCriteriaModel order) {
    this.vSettings.value = this.vSettings.value.copyWith(order: order);
  }

  void updateFilter(FilterModel filter) {
    this.vSettings.value = this.vSettings.value.copyWith(filter: filter);
  }

////////////////////////////////////////////////////////////////////////////////
// TEMPORARY
////////////////////////////////////////////////////////////////////////////////

  void saveFilterCache(FilterModel cache) {
    this.filterCache = this.filterCache.copyWith(frameSize: cache.frameSize, categs: cache.categs, price: cache.price);
  }
}