import 'package:flutter/material.dart';
import '../../../common/models/catalog/BikeModel.dart';
import '../../utils/AppLocalizations.dart';

import '../core/BaseStatelessScreen.dart';


/*
 * Bike detail screen
 */
class BikeScreen extends BaseStatelessScreen {
  final BikeModel bike;

  const BikeScreen(this.bike, {String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return Center(
        child: Container(
      child: Text(this.getScreenTitle(context)),
    ));
  }
  
  @override
  String getScreenTitle(BuildContext cntxt) => AppLocalizations.of(cntxt).translate("screen_detail");
}
