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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this._buildImg(context)
        ],
      ),
    ));
  }
  
  Widget _buildImg(BuildContext cntxt) {
    return Hero(
      tag: this.bike.toTag(),
      child: Image.network(this.bike.mainImg.url),
    );
  } 
  
  @override
  String getScreenTitle(BuildContext cntxt) => this.bike.name;
}
