import 'package:flutter/material.dart';

import '../../app/AppData.dart';
import '../../widgets/factory/AppWidgetFactory.dart';
import '../../widgets/filter/FilterMainWidget.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessScreen.dart';

/*
 * Filter screen used to config catalog settings
 */
class FilterScreen extends BaseStatelessScreen {

  const FilterScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
      return FilterMainWidget(currentFilter: AppData.of(context).vSettings.value.filter);
  }
  
  @override
  String getScreenTitle(BuildContext cntxt) => AppLocalizations.of(cntxt).translate("screen_filter");

  @override
  List<Widget> getBarActions(BuildContext cntxt) => [
    IconButton(icon: Icon(Icons.autorenew), iconSize: ScreenDimens.BAR_ICON_SIZE, onPressed: () {
      AppWidgetFactory.notAvailable(cntxt);
    },)
  ];
}


