import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppStyles.dart';

import '../../resources/AppColors.dart';
import '../../resources/AppDimens.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatefulWidget.dart';

import '../../../common/models/catalog/BikeModel.dart';


/*
 * Widget displaying an icon and a label for a given bike category (type) item
 */
class BikeTypeWidget extends BaseStatefulWidget {
  final BikeCategories categ;

  const BikeTypeWidget({@required this.categ, Key key}) : assert(categ != null), super(key: key);

  @override
  BaseState<BaseStatefulWidget> createState() => _BikeTypeWidgetState();
}

/*
 * Companion state class
 */
class _BikeTypeWidgetState extends BaseState<BikeTypeWidget> {
  bool _selected = false;

  _BikeTypeWidgetState() : super();

  @override
  Widget buildWidgetContents(BuildContext context) {
    final DURATION_IN_SECS = 1;

    return InkWell(
      onTap: this._toogleSelection,
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
              this._buildTypeName(context)
            ],
          )
        ),
      ),
    );
  }

  Widget _buildImg(BuildContext cntxt) => Image.asset(this._getImgResourceForCategory(), color: this._getForeground(),);

  Widget _buildTypeName(BuildContext cntxt) => Text(this._getLabelForCategory(cntxt), style: this._selected? AppStyles.title : AppStyles.titleWhite,);

  Color _getForeground() => this._selected? AppColors.black : AppColors.white;

  Color _getBackground() => !this._selected? AppColors.primary : AppColors.primaryDark;

  void _toogleSelection() {
    this.setState(() {
      this._selected = !this._selected;
    });
  }

  String _getLabelForCategory(BuildContext cntxt) {
    switch (this.widget.categ) {
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

    switch (this.widget.categ) {
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