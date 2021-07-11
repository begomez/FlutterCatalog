import 'package:flutter/material.dart';

import '../../../common/models/catalog/SettingsModel.dart';
import '../../app/AppData.dart';
import '../../widgets/catalog/CatalogMainWidget.dart';
import '../core/BaseStatelessScreen.dart';
import '../../utils/AppLocalizations.dart';
import '../../resources/AppDimens.dart';


/*
 * Home screen displayed after login
 */
class CatalogScreen extends BaseStatelessScreen {

  const CatalogScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: ValueListenableBuilder(
          valueListenable: AppData.of(context).vSettings,
          builder: (BuildContext cntxt, SettingsModel settings, Widget child) {
            return CatalogMainWidget(
              order: settings.order,
              filter: settings.filter,
              key: UniqueKey(),);
          },
    ));
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_home");
}
