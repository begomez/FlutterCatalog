import 'package:flutter/material.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../factory/WidgetFactory.dart';
import '../core/BaseStatelessWidget.dart';
import '../../utils/AppLocalizations.dart';
import '../../app/AppData.dart';
import 'BikeTypeSelectorWidget.dart';
import 'PriceRangeWidget.dart';
import 'FrameSizeSelectorWidget.dart';

import '../../../common/models/catalog/FrameSizeModel.dart';
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
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(AppDimens.MID_SPACING),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            (this._buildTypeSelector(context)),

            (this._buildPriceSlider(context)),

            Expanded(child: this._buildFramesExpandable(context)),

            // action
            WidgetFactory.buildBtn(
                text: AppLocalizations.of(context).translate("action_close"),
                callback: () {
                  Navigator.of(context).pop();
                },
                style: AppStyles.action)
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector(BuildContext cntxt) {
    return BikeTypeSelectorWidget(
      key: ValueKey(this.currentFilter.categs?.toString()),
      currentSelection: this.currentFilter.categs?? const []
    );
  }


  Widget _buildPriceSlider(BuildContext cntxt) {
    return PriceRangeWidget(
      key: ValueKey(PriceModel.forAmount(this.currentFilter.price).hashCode),
      currentPrice: PriceModel.forAmount(this.currentFilter.price)
    );
  }

  Widget _buildFramesExpandable(BuildContext cntxt) {
    final currentFrame = AppData.of(cntxt).vSettings.value.filter.frameSize;

    return FrameSizeSelectorWidget(currentSelection: currentFrame != FrameSizeModel.NO_FRAME_SIZE? FrameSizeModel.forSize(currentFrame) : null);
  }
}
