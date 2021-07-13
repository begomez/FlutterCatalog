import 'package:flutter/material.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../factory/WidgetFactory.dart';
import '../core/BaseStatelessWidget.dart';
import '../../utils/AppLocalizations.dart';
import 'BikeTypeSelectorWidget.dart';
import 'PriceRangeWidget.dart';

import '../../../common/models/catalog/FilterModel.dart';
import '../../../common/models/catalog/PriceModel.dart';


/*
 * Filter main widget
 */
class FilterMainWidget extends BaseStatelessWidget {
  final FilterModel currentFilter;


  const FilterMainWidget({@required this.currentFilter, Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: this._buildSelector()),
          Expanded(child: this._buildSlider()),
          WidgetFactory.buildBtn(
              text: AppLocalizations.of(context).translate("action_close"),
              callback: () {
                Navigator.of(context).pop();
              },
              style: AppStyles.action)
        ],
      ),
    );
  }

  Widget _buildSelector() {
    return BikeTypeSelectorWidget(
      key: ValueKey(this.currentFilter.categs?.toString()),
      currentSelection: this.currentFilter.categs?? const []
    );
  }

  Widget _buildSlider() {
    return PriceRangeWidget(
      key: ValueKey(PriceModel.forAmount(this.currentFilter.price).hashCode),
      currentPrice: PriceModel.forAmount(this.currentFilter.price)
    );
  }
}
