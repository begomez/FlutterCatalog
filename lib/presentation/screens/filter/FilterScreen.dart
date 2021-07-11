import 'package:flutter/material.dart';
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
    return Center(
        child: Container(
      child: Text(this.getScreenTitle(context)),
    ));
  }
  
  @override
  String getScreenTitle(BuildContext cntxt) => AppLocalizations.of(cntxt).translate("screen_filter");
}
