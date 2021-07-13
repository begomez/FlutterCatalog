import 'package:flutter/material.dart';

import '../../resources/AppStyles.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppValues.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';
import '../../app/AppData.dart';

import '../../../common/models/catalog/BikeModel.dart';


/*
 * Widget displaying an icon and a label for a given bike category (type) item
 */
class BikeTypeWidget extends BaseStatelessWidget {
  //final Function(BikeCategories) onItemClicked;
  final BikeCategories categ;
  final bool selected;

  const BikeTypeWidget({@required this.categ, this.selected = false, Key key}) : assert(categ != null), super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    final DURATION_IN_SECS = 1;

    return InkWell(
      onTap: () {
        this._toogleSelection(context);
      },
      child: ClipRect(
        child: AnimatedContainer(
          height: _BikeTypeDimens.ITEM_H,
          duration: Duration(seconds: DURATION_IN_SECS),
          margin: EdgeInsets.all(AppDimens.SMALL_SPACING),
          padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
          color: this._getBackground(),
          child: Column(
            children: [
              this._buildImg(context),
              Expanded(child: this._buildTypeName(context))
            ],
          )
        ),
      ),
    );
  }

  Widget _buildImg(BuildContext cntxt) => Image.asset(this._getImgResourceForCategory(), color: this._getForeground(),);

  Widget _buildTypeName(BuildContext cntxt) => Text(this._getLabelForCategory(cntxt), style: this.selected? AppStyles.title : AppStyles.titleWhite, maxLines: AppValues.TWO_LINES, overflow: TextOverflow.ellipsis,);

  Color _getForeground() => this.selected? AppColors.black : AppColors.white;

  Color _getBackground() => !this.selected? AppColors.primary : AppColors.primaryDark;

  void _toogleSelection(BuildContext cntxt) {
    final filter = AppData.of(cntxt).vSettings.value.filter;

    final List<BikeCategories> categs = List.of(filter.categs);

    if (categs.contains(this.categ)) {
      categs.remove(this.categ);

    } else {
      categs.add(this.categ);
    }

    AppData.of(cntxt).updateFilter(filter.copyWith(categs: categs));
  }

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
  static const ITEM_H = 100.0;
}