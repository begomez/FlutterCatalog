import 'package:flutter/material.dart';
import 'dart:math';

import '../../app/AppData.dart';
import '../../resources/AppValues.dart';
import '../../resources/AppStyles.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseBlocWidget.dart';

import '../../../common/models/catalog/PriceRangeModel.dart';
import '../../../common/models/catalog/PriceModel.dart';

import '../../../domain/bloc/PriceRangeBloc.dart';
import '../../../domain/event/PriceRangeEvent.dart';
import '../../../network/api/CatalogAPIImpl.dart';


/*
 * Widget that allows setting a price inside a price range.
 *
 * Prices range retrieved dynamically through BLoC
 */
class PriceRangeWidget extends BaseBlocWidget {
  final PriceModel currentSelection;

  const PriceRangeWidget({this.currentSelection, Key key}) : super(key: key);

  @override
  _PriceRangeWidgetState createState() => _PriceRangeWidgetState(this.currentSelection);
}

/*
 * Companion state class
 */
class _PriceRangeWidgetState extends BaseBlocWidgetState<PriceRangeWidget, PriceRangeBloc, PriceRangeEvent, PriceRangeModel> {
  PriceModel _selectedPrice;

  _PriceRangeWidgetState(this._selectedPrice) : super();

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
            child: this._buildHints(cntxt, data))
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) =>
    Text(AppLocalizations.of(cntxt).translate("lb_price"),
        style: AppStyles.title,
        maxLines: AppValues.ONE_LINE,
        textAlign: TextAlign.start);

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
        value: range.validate() && this._selectedPrice.validate()? this._selectedPrice.amount : range.min.amount,
        divisions: range.getNumSteps(),
        onChanged: this._onValueSelected,
        label: this._selectedPrice.validate()? "": this._selectedPrice.toString(),
      ),
    );
  }

  Widget _buildHints(BuildContext cntxt, PriceRangeModel range) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: AppDimens.MID_SPACING),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this._innerBuildHints(cntxt, range),
      ),
    );
  }

  List<Widget> _innerBuildHints(BuildContext cntxt, PriceRangeModel range) {
    return List.generate(
        range.getNumSteps() + 1,
        (index) => Transform.rotate(
            angle: pi / 2,
            child: Text(PriceModel.forAmount(range.min.amount + (range.getStepSize() * index)).toString()//build dynamically using min + increments
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

  void _onValueSelected(double value) {
    final currentFilterCache = AppData.of(this.context).filterCache;

    this.setState(() {
      this._selectedPrice = PriceModel.forAmount(value);
    });

    AppData.of(this.context).saveFilterCache(currentFilterCache.copyWith(price: value));
  }
}