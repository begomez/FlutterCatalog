import 'package:flutter/material.dart';

import '../../common/models/filters/CatalogSettingsModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/filters/OrderCriteriaModel.dart';


/*
 * Simple impl. of "Lifting state up" pattern using an inherited widget that holds global app state.
 * Stores data in a notifier that updates the components observing the data.
 */
class AppData extends InheritedWidget {

  /*
   * Observable data storing ordering and applied filters
   */
  ValueNotifier<CatalogSettingsModel> vSettings;

  /*
   * Temporary, not observable data, to store filter selection before submitting filter changes
   */
  FilterModel filterCache;


  AppData({@required Widget child,  Key key}) : assert(child != null), super(key: key, child: child) {
    this.vSettings = ValueNotifier<CatalogSettingsModel>(CatalogSettingsModel.defaultSettings());
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
// STATE OPS
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
// TEMPORARY OPS
////////////////////////////////////////////////////////////////////////////////

  void saveFilterCache(FilterModel cache) {
    this.filterCache = this.filterCache.copyWith(frameSize: cache.frameSize, categs: cache.categs, price: cache.price);
  }
}