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
        margin: EdgeInsets.all(AppDimens.SMALL_SPACING),
        child: Card(
          color: AppColors.white,
          child: Stack(children: [
            this._buildDecoration(context),
            Positioned(top: 0, left: 0, child: this._buildPrice()),
            Positioned(bottom: 0, right: 0, child: this._buildName())
          ]),
        ),
      ),
    );
  }

  Widget _buildDecoration(BuildContext cntxt) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.trans, AppColors.trans, Colors.grey],
        ),
      ),
      child: this._buildImg(cntxt),
    );
  }

  Widget _buildImg(BuildContext cntxt) {
    return Hero(
      tag: this.item.toTag(),
      child: Container(
        width: double.maxFinite,
        child: Image.network(
          this.item.mainImg.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Padding(padding: EdgeInsets.all(AppDimens.SMALL_SPACING), child: Text(this.item.name.toUpperCase(), style: AppStyles.titleWhite,));
  }

  Widget _buildPrice() {
    return Container(color: Colors.yellow, padding:EdgeInsets.all(AppDimens.SMALL_SPACING), child: Text(this.item.price.toString()),);
  }
}

abstract class _ItemWidgetDimens {
  static const HEIGHT = 200.0;
}
