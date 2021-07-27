import 'package:flutter/material.dart';

import '../../../common/models/filters/FilterModel.dart';
import '../../../common/models/filters/CatalogSettingsModel.dart';

import '../../resources/AppColors.dart';
import '../../app/AppData.dart';
import '../../widgets/filter/FilterMainWidget.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessScreen.dart';

/*
 * Filter screen used to config catalog settings: 
 * filter by type, by price, by frame
 */
class FilterScreen extends BaseStatelessScreen {
  const FilterScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppData.of(context).vSettings,
        builder:
            (BuildContext cntxt, CatalogSettingsModel value, Widget child) =>
                FilterMainWidget(
                    currentFilter: value.filter,
                    key: ValueKey(value.hashCode)));
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_filter");

  @override
  List<Widget> getBarActions(BuildContext cntxt) => [
        // RESET
        IconButton(
          icon: Icon(Icons.autorenew, color: AppColors.white),
          iconSize: ScreenDimens.BAR_ICON_SIZE,
          onPressed: () {
            AppData.of(cntxt).updateFilter(FilterModel.defaultFilter());
          },
        ),

        // SAVE AND EXIT
        IconButton(
          icon: Icon(Icons.save, color: AppColors.white),
          iconSize: ScreenDimens.BAR_ICON_SIZE,
          onPressed: () {
            AppData.of(cntxt).applyFilterCache();
            Navigator.of(cntxt).pop();
          },
        ),
      ];
}
