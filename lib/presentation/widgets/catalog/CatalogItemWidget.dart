import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppStyles.dart';

import '../../../common/models/catalog/BikeModel.dart';
import '../core/BaseStatelessWidget.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';

/*
 * Widget displaying a bike card item
 */
class CatalogItemWidget extends BaseStatelessWidget {
  final Function(BikeModel) onItemClicked;
  final BikeModel item;

  const CatalogItemWidget(this.onItemClicked, this.item, {Key key})
      : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onItemClicked?.call(this.item);
      },
      child: Container(
        height: _ItemWidgetDimens.HEIGHT,
        margin: EdgeInsets.all(AppDimens.MID_SPACING),
        child: Card(
          color: AppColors.white,
          child: Stack(children: [
            this._buildImg(),
            Positioned(top: 0, left: 0, child: this._buildPrice()),
            Positioned(bottom: 0, right: 0, child: this._buildName())
          ]),
        ),
      ),
    );
  }

  Widget _buildImg() {
    return Hero(
      tag: this.item.toTag(),
      child: Image.network(
        this.item.mainImg.url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildName() {
    return Padding(padding: EdgeInsets.all(AppDimens.SMALL_SPACING), child: Text(this.item.name.toUpperCase(), style: AppStyles.title,));
  }

  Widget _buildPrice() {
    return Container(color: Colors.yellow, padding:EdgeInsets.all(AppDimens.SMALL_SPACING), child: Text(this.item.price.toString()),);
  }
}

abstract class _ItemWidgetDimens {
  static const HEIGHT = 200.0;
}
