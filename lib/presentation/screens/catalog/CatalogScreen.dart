import 'package:flutter/material.dart';

import '../../widgets/catalog/CatalogListWidget.dart';
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
      child: CatalogListWidget(),
    );
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_home");
}
