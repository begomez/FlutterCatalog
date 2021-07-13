import 'package:flutter/material.dart';

import '../../resources/AppValues.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';
import 'BikeTypeWidget.dart';

import '../../../common/models/catalog/BikeModel.dart';


/*
 * Widget that allows user selecting different bike categories
 */
class BikeTypeSelectorWidget extends BaseStatelessWidget {
  final List<BikeCategories> currentSelection;

  BikeTypeSelectorWidget({this.currentSelection = const [], Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildTitle(context),
          this._buildSelector(context, this.currentSelection)
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) => Text(AppLocalizations.of(cntxt).translate("lb_category"), style: AppStyles.title,  textAlign: TextAlign.start, maxLines: AppValues.ONE_LINE,);

  Widget _buildSelector(BuildContext cntxt, List<BikeCategories> categs) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: BikeTypeWidget(categ: BikeCategories.CITY, selected: this.currentSelection.contains(BikeCategories.CITY),)),
        Expanded(child: BikeTypeWidget(categ: BikeCategories.MOUNTAIN, selected: this.currentSelection.contains(BikeCategories.MOUNTAIN),)),
        Expanded(child: BikeTypeWidget(categ: BikeCategories.ELECTRIC, selected: this.currentSelection.contains(BikeCategories.ELECTRIC),)),
      ],
    );
  }
}