import 'package:flutter/material.dart';

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

  BikeTypeSelectorWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildTitle(context),
          this._buildSelector(context)
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) => Text(AppLocalizations.of(cntxt).translate("lb_category"), style: AppStyles.title, );

  Widget _buildSelector(BuildContext cntxt) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: BikeTypeWidget(categ: BikeCategories.CITY)),
        Expanded(child: BikeTypeWidget(categ: BikeCategories.MOUNTAIN)),
        Expanded(child: BikeTypeWidget(categ: BikeCategories.ELECTRIC)),
      ],
    );
  }
}