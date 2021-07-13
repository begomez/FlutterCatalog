import 'package:flutter/material.dart';
import 'dart:math';

import '../../app/AppData.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseBlocWidget.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';

import '../../../common/models/catalog/PriceRangeModel.dart';
import '../../../common/models/catalog/PriceModel.dart';

import '../../../domain/bloc/PriceRangeBloc.dart';
import '../../../domain/event/PriceRangeEvent.dart';
import '../../../network/api/CatalogAPIImpl.dart';

/*
 * Widget that allows setting a price inside a price range
 */
class PriceRangeWidget extends BaseBlocWidget {
  final PriceModel currentPrice;

  const PriceRangeWidget({this.currentPrice, Key key}) : super(key: key);

  @override
  _PriceRangeWidgetState createState() => _PriceRangeWidgetState(this.currentPrice);
}

class _PriceRangeWidgetState extends BaseBlocWidgetState<PriceRangeWidget, PriceRangeBloc, PriceRangeEvent, PriceRangeModel> {
  PriceModel currentPrice;

  _PriceRangeWidgetState(this.currentPrice) : super();

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildUI(cntxt, PriceRangeModel.invalid());
  }

  @override
  Widget buildSuccess(BuildContext cntxt, PriceRangeModel data) {
    return this._buildUI(cntxt, data);
  }

  Widget _buildUI(BuildContext cntxt, PriceRangeModel data) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildTitle(cntxt),
          Visibility(
            visible: data.validate(),
            child: this._buildSlider(cntxt, data)),
          Visibility(
            visible: data.validate(),
            child: this._buildHintsRow(cntxt, data))
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) =>
    Text(AppLocalizations.of(cntxt).translate("lb_price"), style: AppStyles.title,);

  Widget _buildSlider(BuildContext cntxt, PriceRangeModel range) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Slider(
        activeColor: AppColors.primaryDark,
        inactiveColor: AppColors.primary,
        min: range.validate()? range.min.amount : 0.0,
        max: range.validate()? range.max.amount : 0.0,
        value: range.validate() && this.currentPrice.validate()? this.currentPrice.amount : range.min.amount,
        divisions: range.getNumSteps(),
        onChanged: this._onValueSelected,
        label: this.currentPrice.validate()? "": this.currentPrice.toString(),
      ),
    );
  }

  void _onValueSelected(double value) {
    final currentFilter = AppData.of(this.context).vSettings.value.filter;

    AppData.of(this.context).updateFilter(currentFilter.copyWith(price: value));
  }

  Widget _buildHintsRow(BuildContext cntxt, PriceRangeModel range) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: AppDimens.MID_SPACING),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this._buildHints(cntxt, range),
      ),
    );
  }

  List<Widget> _buildHints(BuildContext cntxt, PriceRangeModel range) {
    return List.generate(
        range.getNumSteps() + 1,
        (index) => Transform.rotate(
            angle: pi / 2,
            child: Text(PriceModel.forAmount(range.min.amount + (range.getStepSize() * index)).toString()
            )
        )
    );
  }

  @override
  PriceRangeBloc getBlocInstance() => PriceRangeBloc(CatalogAPIImpl());

  @override
  PriceRangeEvent getEvent() => PriceRangeEvent();

  @override
  bool isAutocall() => true;
}