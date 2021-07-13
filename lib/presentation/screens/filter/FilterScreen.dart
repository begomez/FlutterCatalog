import 'package:flutter/material.dart';

import '../../app/AppData.dart';
import '../../widgets/filter/FilterMainWidget.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessScreen.dart';

import '../../../common/models/filters/SettingsModel.dart';
import '../../../common/models/filters/FilterModel.dart';

/*
 * Filter screen
 */
class FilterScreen extends BaseStatelessScreen {

  const FilterScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppData.of(context).vSettings,
        builder: (BuildContext cntxt, SettingsModel settings, Widget child) {
          return FilterMainWidget(currentFilter: settings.filter, key: ValueKey(settings.filter.hashCode),);
        },
      );
  }
  
  @override
  String getScreenTitle(BuildContext cntxt) => AppLocalizations.of(cntxt).translate("screen_filter");

  @override
  List<Widget> getBarActions(BuildContext cntxt) => [
    IconButton(icon: Icon(Icons.autorenew), iconSize: ScreenDimens.BAR_ICON_SIZE, onPressed: () {
      AppData.of(cntxt).updateFilter(FilterModel.defaultFilter());
    },)
  ];
}


