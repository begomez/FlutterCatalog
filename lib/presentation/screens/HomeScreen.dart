import 'package:flutter/material.dart';

import 'core/BaseStatelessScreen.dart';
import '../utils/AppLocalizations.dart';

/*
 * Home screen displayed after login
 */
class HomeScreen extends BaseStatelessScreen {

  const HomeScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return Center(
        child: Container(
      child: Text(this.getScreenTitle(context)),
    ));
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_home");
}
