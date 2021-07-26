import 'package:flutter/material.dart';

import '../../widgets/detail/BikeMainWidget.dart';
import '../../../common/models/catalog/BikeModel.dart';
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
    return BikeMainWidget(this.bike);
  }

  @override
  String getScreenTitle(BuildContext cntxt) => this.bike.name;
}
