import 'package:flutter/material.dart';

import '../../../common/models/catalog/FrameSizeModel.dart';
import '../../../common/models/catalog/PriceModel.dart';
import '../../../common/models/filters/FilterModel.dart';

import '../../app/AppData.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';
import '../factory/AppWidgetFactory.dart';
import 'BikeTypeSelectorWidget.dart';
import 'FrameSizeSelectorWidget.dart';
import 'PriceRangeWidget.dart';


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
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(AppDimens.MID_SPACING),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              this._buildTypeSelector(context),

              this._buildPriceSlider(context),

              Expanded(child: this._buildFrameSizeSelector(context)),

              this._buildAction(context)
            ],
          ),
        ),
    );
  }

  Widget _buildTypeSelector(BuildContext cntxt) {
    final currentType = this.currentFilter.categs;

    return BikeTypeSelectorWidget(
      key: ValueKey(currentType.hashCode),
      currentSelection: currentType?? const []
    );
  }

  Widget _buildPriceSlider(BuildContext cntxt) {
    final currentPrice = this.currentFilter.price;

    return PriceRangeWidget(
      key: ValueKey(PriceModel.forAmount(currentPrice)),
      currentSelection: PriceModel.forAmount(currentPrice)
    );
  }

  Widget _buildFrameSizeSelector(BuildContext cntxt) {
    final currentFrame = this.currentFilter.frameSize;

    return FrameSizeSelectorWidget(
        key: ValueKey(currentFrame.hashCode),
        currentSelection: currentFrame != FrameSizeModel.NO_FRAME_SIZE? FrameSizeModel.forSize(currentFrame) : null);
  }

  Widget _buildAction(BuildContext cntxt) {
    return AppWidgetFactory.buildBtn(
        text: AppLocalizations.of(cntxt).translate("action_close"),
        callback: () {

          // Update filters only when confirming, by applying temporary selection stored
          AppData.of(cntxt).applyFilterCache();
          Navigator.of(cntxt).pop();
        },
        style: AppStyles.action
    );
  }
}
