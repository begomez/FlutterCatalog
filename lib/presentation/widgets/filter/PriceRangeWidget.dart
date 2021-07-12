import 'package:flutter/material.dart';
import 'dart:math';

import '../../app/AppData.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseBlocWidget.dart';
import '../../resources/AppDimens.dart';

import '../../../common/models/catalog/PriceRangeModel.dart';

import '../../../domain/bloc/PriceRangeBloc.dart';
import '../../../domain/event/PriceRangeEvent.dart';
import '../../../network/api/CatalogAPIImpl.dart';

/*
 * Widget that allows setting a price inside a price range
 */
class PriceRangeWidget extends BaseBlocWidget {
  
  const PriceRangeWidget({Key key}) : super(key: key);
  
  @override
  _PriceRangeWidgetState createState() => _PriceRangeWidgetState();
}

class _PriceRangeWidgetState extends BaseBlocWidgetState<PriceRangeWidget, PriceRangeBloc, PriceRangeEvent, PriceRangeModel> {
  double _currentVal;

  _PriceRangeWidgetState() : super();

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildUI(cntxt, PriceRangeModel.empty());
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
          this._buildSlider(cntxt, data),
          this._buildHintsRow(cntxt, data)
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
        min: range.min.amount,
        max: range.max.amount,
        value: this._currentVal ?? range.min.amount,
        divisions: range.getNumSteps(),
        onChanged: this._onValueSelected,
        label: this._currentVal.toString(),
      ),
    );
  }

  void _onValueSelected(double value) {
    final currentFilter = AppData.of(this.context).vSettings.value.filter;

    AppData.of(this.context).updateFilter(currentFilter.copyWith(price: value));

    this.setState(() {
      this._currentVal = value;
    });
  }

  Widget _buildHintsRow(BuildContext cntxt, PriceRangeModel range) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
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
            child: Text((range.min.amount + (range.getStepSize() * index)).round().toString())));
  }

  @override
  PriceRangeBloc getBlocInstance() => PriceRangeBloc(CatalogAPIImpl());

  @override
  PriceRangeEvent getEvent() => PriceRangeEvent();

  @override
  bool isAutocall() => true;

}