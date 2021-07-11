import 'package:flutter/material.dart';

import '../../../common/models/BikeModel.dart';
import '../core/BaseStatelessWidget.dart';
import '../../resources/AppDimens.dart';


/*
 * Widget displaying a bike card item
 */
class CatalogItemWidget extends BaseStatelessWidget {
  final BikeModel item;

  const CatalogItemWidget(this.item, {Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(AppDimens.MID_SPACING),
        child: Image.network(this.item.mainImg.url),
      ),
    );
  }
}