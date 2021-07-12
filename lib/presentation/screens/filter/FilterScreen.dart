import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppDimens.dart';
import 'package:flutter_catalog/presentation/resources/AppStyles.dart';
import 'package:flutter_catalog/presentation/widgets/factory/WidgetFactory.dart';
import 'package:flutter_catalog/presentation/widgets/filter/PriceRangeWidget.dart';
import '../../utils/AppLocalizations.dart';

import '../../navigation/AppNavigator.dart';
import '../core/BaseStatelessScreen.dart';


/*
 * Filter screen
 */
class FilterScreen extends BaseStatelessScreen {

  const FilterScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: PriceRangeWidget()),
          WidgetFactory.buildBtn(
              text: AppLocalizations.of(context).translate("action_close"),
              callback: () {
                Navigator.of(context).pop();
              },
              style: AppStyles.action)
        ],
      ),
    );
  }
  
  @override
  String getScreenTitle(BuildContext cntxt) => AppLocalizations.of(cntxt).translate("screen_filter");
}
