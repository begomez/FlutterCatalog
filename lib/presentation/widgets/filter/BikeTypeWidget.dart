import 'package:flutter/material.dart';

import '../../resources/AppStyles.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppValues.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';

import '../../../common/models/catalog/BikeModel.dart';

/*
 * Widget displaying an icon and a label for a given bike category (type) item
 */
class BikeTypeWidget extends BaseStatelessWidget {
  final BikeCategories categ;
  final bool selected;

  const BikeTypeWidget({@required this.categ, this.selected = false, Key key})
      : assert(categ != null),
        super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    final DURATION_IN_SECS = 1;

    return ClipRect(
      child: AnimatedContainer(
          height: _BikeTypeDimens.ITEM_H,
          duration: Duration(seconds: DURATION_IN_SECS),
          margin: EdgeInsets.all(AppDimens.SMALL_SPACING),
          padding: EdgeInsets.symmetric(vertical: AppDimens.SMALL_SPACING),
          color: this._getBackground(),
          child: Column(
            children: [
              this._buildTypeName(context),
              Expanded(child: this._buildImg(context)),
            ],
          )),
    );
  }

  Widget _buildTypeName(BuildContext cntxt) => Text(
        this._getLabelForCategory(cntxt),
        style: AppStyles.captionWhite,
        maxLines: AppValues.TWO_LINES,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildImg(BuildContext cntxt) => Image.asset(
        this._getImgResourceForCategory(),
        color: AppColors.white,
      );

  Color _getForeground() => this.selected ? AppColors.black : AppColors.white;

  Color _getBackground() =>
      !this.selected ? AppColors.primary : AppColors.primaryDark;

  String _getLabelForCategory(BuildContext cntxt) {
    switch (this.categ) {
      case BikeCategories.MOUNTAIN:
        return AppLocalizations.of(cntxt).translate("type_mountain");
      case BikeCategories.ELECTRIC:
        return AppLocalizations.of(cntxt).translate("type_electric");
      case BikeCategories.CITY:
      default:
        return AppLocalizations.of(cntxt).translate("type_city");
    }
  }

  String _getImgResourceForCategory() {
    final PATH = "assets/images/";
    final EXTENSION = ".png";

    switch (this.categ) {
      case BikeCategories.MOUNTAIN:
        return "$PATH${"mountain"}$EXTENSION";
      case BikeCategories.ELECTRIC:
        return "$PATH${"electric"}$EXTENSION";
      case BikeCategories.CITY:
      default:
        return "$PATH${"city"}$EXTENSION";
    }
  }
}

abstract class _BikeTypeDimens {
  static const ITEM_H = 110.0;
}
