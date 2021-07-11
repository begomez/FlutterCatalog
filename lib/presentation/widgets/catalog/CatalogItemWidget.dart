import 'package:flutter/material.dart';

import '../../../common/models/catalog/BikeModel.dart';
import '../core/BaseStatelessWidget.dart';
import '../../resources/AppDimens.dart';


/*
 * Widget displaying a bike card item
 */
class CatalogItemWidget extends BaseStatelessWidget {
  final Function(BikeModel) onItemClicked;
  final BikeModel item;

  const CatalogItemWidget(this.onItemClicked, this.item, {Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onItemClicked?.call(this.item);
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.all(AppDimens.MID_SPACING),
          child: Image.network(this.item.mainImg.url),
        ),
      ),
    );
  }
}